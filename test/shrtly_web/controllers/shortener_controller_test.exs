defmodule ShrtlyWeb.ShortenerControllerTest do
  use ShrtlyWeb.ConnCase

  test "Get /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "shorten-form"
  end
end
