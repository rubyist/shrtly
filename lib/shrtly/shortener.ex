defmodule Shrtly.Shortener do
  alias Shrtly.Repo
  alias Shrtly.Shortener.Url

  def get_url(id) do
    Repo.get_by!(Url, %{:id => id})
  end

  def get_url_by_code(code) do
    Repo.get_by!(Url, %{:code => code})
  end

  def get_url_by_fun_code(code) do
    Repo.get_by!(Url, %{:fun_code => code})
  end

  def change_url(%Url{} = url, params) do
    Url.create_changeset(url, params)
  end

  @doc "create the url"
  def create_url(attrs \\ %{}) do
    # Create the url
    %Url{}
    |> Url.changeset(attrs)
    |> Repo.insert()
  end
end
