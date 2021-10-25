defmodule ShrtlyWeb.ShortenerController do
  use ShrtlyWeb, :controller

  alias Shrtly.Shortener
  alias Shrtly.Shortener.Url

  def index(conn, _params) do
    changeset = Shortener.change_url(%Url{}, %{})
    render(conn, "index.html", changeset: changeset)
  end
end
