defmodule Shrtly.Repo.Migrations.CreateSequence do
  use Ecto.Migration

  def up do
    execute("CREATE SEQUENCE url_seq START 1")
  end

  def down do
    execute("DROP SEQUENCE url_seq")
  end
end
