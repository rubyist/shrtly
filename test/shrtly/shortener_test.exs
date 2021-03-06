defmodule Shrtly.ShortenerTest do
  use Shrtly.DataCase

  describe "get_url/1" do
    test "finds existing url" do
      {:ok, url} = Shrtly.Shortener.create_url(%{url: "https://google.com"})
      found_url = Shrtly.Shortener.get_url(url.id)
      assert found_url.id == url.id
    end

    test "for non existing url" do
      assert_raise Ecto.NoResultsError, fn ->
        Shrtly.Shortener.get_url(42)
      end
    end
  end

  describe "get_url_by_code/1" do
    test "finds existing url by code" do
      {:ok, url} = Shrtly.Shortener.create_url(%{url: "https://google.com"})
      found_url = Shrtly.Shortener.get_url_by_code(url.code)
      assert found_url.id == url.id
    end

    test "for non existing code" do
      assert_raise Ecto.NoResultsError, fn ->
        Shrtly.Shortener.get_url_by_code("XYZ")
      end
    end
  end

  describe "get_url_by_fun_code/1" do
    test "finds an existing url by fun code" do
      {:ok, url} = Shrtly.Shortener.create_url(%{url: "https://google.com"})
      found_url = Shrtly.Shortener.get_url_by_fun_code(url.fun_code)
      assert found_url.id == url.id
    end

    test "for non existing fun code" do
      assert_raise Ecto.NoResultsError, fn ->
        Shrtly.Shortener.get_url_by_fun_code("😫")
      end
    end
  end

  describe "create_url/1" do
    test "with valid data" do
      {:ok, url} = Shrtly.Shortener.create_url(%{url: "https://google.com"})
      assert url.url == "https://google.com"
      assert url.code != nil
      assert url.code != ""
      assert url.fun_code != nil
      assert url.fun_code != ""
    end

    test "with no url" do
      assert {:error, %Ecto.Changeset{}} = Shrtly.Shortener.create_url(%{})
    end

    test "with invalid url" do
      assert {:error, %Ecto.Changeset{}} = Shrtly.Shortener.create_url(%{url: "google.com"})
    end
  end
end
