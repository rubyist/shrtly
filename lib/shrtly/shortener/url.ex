defmodule Shrtly.Shortener.Url do
  use Ecto.Schema
  import Ecto.Changeset

  schema "urls" do
    field :url, :string
    field :code, :string

    timestamps()
  end

  def changeset(url, attrs) do
    url
    |> cast(attrs, [:url])
    |> validate_required([:url])
    |> validate_format(:url, ~r/^https?:\/\/.+/)
  end
end
