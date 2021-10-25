defmodule Shrtly.Shortener do
  alias Shrtly.Repo
  alias Shrtly.Shortener.Url

  def get_url(id) do
    Repo.get_by!(Url, %{:id => id})
  end

  def create_url(attrs \\ %{}) do
    %Url{}
    |> Url.changeset(attrs)
    |> Repo.insert()
  end
end
