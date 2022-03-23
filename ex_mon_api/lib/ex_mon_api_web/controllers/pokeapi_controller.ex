defmodule ExMonWeb.PokeApiController do
  use ExMonWeb, :controller

  action_fallback ExMonWeb.FallbackController

  def show(conn, %{"name" => name}) do
    name
    |> ExMon.fetch_pokeapi()
    |> handle_response(conn)
  end

  defp handle_response({:error, _reason} = error, _conn), do: error

  defp handle_response({:ok, pokemon}, conn) do
    conn
    |> put_status(:ok)
    |> json(pokemon)
  end
end
