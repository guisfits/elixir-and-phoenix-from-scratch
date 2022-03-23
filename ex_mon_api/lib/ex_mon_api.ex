defmodule ExMon do
  alias ExMon.Trainer
  alias ExMon.PokeApi
  alias ExMon.Pokemon

  defdelegate fetch_trainer(params), to: Trainer.Get, as: :call
  defdelegate create_trainer(params), to: Trainer.Create, as: :call
  defdelegate update_trainer(params), to: Trainer.Update, as: :call
  defdelegate delete_trainer(params), to: Trainer.Delete, as: :call

  defdelegate fetch_pokeapi(params), to: PokeApi.Get, as: :call

  defdelegate fetch_pokemon(params), to: Pokemon.Get, as: :call
  defdelegate create_pokemon(params), to: Pokemon.Create, as: :call
  defdelegate update_pokemon(params), to: Pokemon.Update, as: :call
  defdelegate delete_pokemon(params), to: Pokemon.Delete, as: :call
end
