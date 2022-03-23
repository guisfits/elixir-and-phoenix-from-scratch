defmodule ExMon.Repo do
  use Ecto.Repo,
    otp_app: :ex_mon_api,
    adapter: Ecto.Adapters.Postgres
end
