defmodule ExMon.PokeApi.Get do

  alias ExMon.PokeApi
  alias ExMon.PokeApi.Client

  def call(name) do
    name
    |> Client.get_pokeApi()
    |> handle_response()
  end

  def handle_response({:ok, body}), do: {:ok, PokeApi.build(body)}
  def handle_response({:error, _reason} = error), do: error
end
