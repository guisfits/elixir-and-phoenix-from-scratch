defmodule ExMon.PokeApi.ClientTest do
  use ExUnit.Case
  import Tesla.Mock

  alias ExMon.PokeApi.Client

  describe "get_pokemon/1" do
    test "when there is a pokemon with the given name, return the pokemon" do
      # arrange
      body = %{ "name" => "pikachu", "weight" => 60, "types" => ["electric"] }

      mock(fn %{method: :get, url: "https://pokeapi.co/api/v2/pokemon/pikachu" } ->
        %Tesla.Env{
          status: 200,
          body: body
        }
      end)

      response = Client.get_pokeApi("pikachu")

      # act
      expected_response = {:ok, %{ "name" => "pikachu", "weight" => 60, "types" => ["electric"] } }

      # assert
      assert response == expected_response
    end
  end
end
