defmodule ShrtlyWeb.ShortenerControllerTest do
  use ShrtlyWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "shorten-form"
  end

  test "POST / with valid data", %{conn: conn} do
    conn = post(conn, "/", %{url: %{url: "https://google.com"}})
    assert redirected_to(conn) =~ "/url/"
  end

  test "POST / with bad data", %{conn: conn} do
    conn = post(conn, "/", %{url: %{url: "google.com"}})
    assert html_response(conn, 200) =~ "has invalid format"
  end

  test "GET /url/:id", %{conn: conn} do
    {:ok, url} = Shrtly.Shortener.create_url(%{url: "https://google.com"})
    conn = get(conn, "/url/#{url.id}")
    resp = html_response(conn, 200)
    assert resp =~ "https://google.com"
    assert resp =~ "#{Routes.shortener_url(conn, :index)}#{url.code}"
  end

  test "GET /url/:id for non existing url", %{conn: conn} do
    assert_error_sent :not_found, fn ->
      get(conn, "/url/42")
    end
  end

  test "GET /:code redirects to expanded URL", %{conn: conn} do
    {:ok, url} = Shrtly.Shortener.create_url(%{url: "https://google.com"})
    conn = get(conn, "/#{url.code}")
    assert redirected_to(conn) == "https://google.com"
  end

  test "GET /:code sends a 404 for non existing URL", %{conn: conn} do
    assert_error_sent :not_found, fn ->
      get(conn, "/XYZ")
    end
  end
end
