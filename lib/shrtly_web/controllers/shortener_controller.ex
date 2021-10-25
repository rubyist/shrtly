defmodule ShrtlyWeb.ShortenerController do
  use ShrtlyWeb, :controller

  alias Shrtly.Shortener
  alias Shrtly.Shortener.Url

  def index(conn, _params) do
    changeset = Shortener.change_url(%Url{}, %{})
    render(conn, "index.html", changeset: changeset)
  end

  def create(conn, %{"url" => url_params}) do
    case Shortener.create_url(url_params) do
      {:ok, url} ->
        redirect(conn, to: Routes.shortener_path(conn, :show, url.id))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "index.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    url = Shortener.get_url(id)
    render(conn, "show.html", url: url)
  end

  def redir(conn, %{"code" => code}) do
    url = Shortener.get_url_by_code(code)
    redirect(conn, external: url.url)
  end
end
