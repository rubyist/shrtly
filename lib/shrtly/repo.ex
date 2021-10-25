defmodule Shrtly.Repo do
  use Ecto.Repo,
    otp_app: :shrtly,
    adapter: Ecto.Adapters.Postgres
end
