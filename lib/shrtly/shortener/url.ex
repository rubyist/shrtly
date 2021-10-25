defmodule Shrtly.Shortener.Url do
  use Ecto.Schema
  import Ecto.Changeset

  alias Shrtly.Shortener.ShortCode
  alias Shrtly.Shortener.FunCode

  schema "urls" do
    field :url, :string
    field :code, :string
    field :fun_code, :string

    timestamps()
  end

  def create_changeset(url, attrs) do
    url
    |> cast(attrs, [:url])
  end

  def changeset(url, attrs) do
    url
    |> cast(attrs, [:url])
    |> validate_required([:url])
    |> validate_format(:url, ~r/^https?:\/\/.+/)
    |> generate_short_code()
  end

  defp generate_short_code(changeset) do
    id = get_next_id()
    changeset
    |> put_change(:code, ShortCode.generate(id))
    |> put_change(:fun_code, FunCode.generate(id))
  end

  defp get_next_id do
    %Postgrex.Result{rows: [[id]]} = Shrtly.Repo.query!("SELECT nextval('url_seq')")
    id
  end
end
