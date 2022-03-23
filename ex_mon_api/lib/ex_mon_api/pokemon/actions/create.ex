defmodule ExMon.Pokemon.Create do
  alias ExMon.PokeApi.Get
  alias ExMon.PokeApi
  alias ExMon.Pokemon
  alias ExMon.Repo

  def call(%{"name" => name} = params) do
    name
    |> Get.call()
    |> handle_response(params)
  end

  defp handle_response({:error, _reason} = error, _params), do: error

  defp handle_response(
    {:ok, %PokeApi{name: name, weight: weight, types: types}},
    %{ "nickname" => nickname, "trainer_id" => trainer_id }
  ) do
    params = %{
      name: name,
      weight: weight,
      types: types,
      nickname: nickname,
      trainer_id: trainer_id
    }

    params
    |> Pokemon.build()
    |> handle_build()
  end

  defp handle_build({:ok, pokemon}), do: Repo.insert(pokemon)
  defp handle_build({:error, _changeset} = error), do: error
end
