defmodule Shrtly.Repo.Migrations.AddFunCode do
  use Ecto.Migration

  def change do
    alter table("urls") do
      add :fun_code, :string
    end
  end
end
