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

  describe "create_url/1" do
    test "with valid data" do
      {:ok, url} = Shrtly.Shortener.create_url(%{url: "https://google.com"})
      assert url.url == "https://google.com"
    end

    test "with no url" do
      assert {:error, %Ecto.Changeset{}} = Shrtly.Shortener.create_url(%{})
    end

    test "with invalid url" do
      assert {:error, %Ecto.Changeset{}} = Shrtly.Shortener.create_url(%{url: "google.com"})
    end
  end
end
