defmodule ExMon.Trainer.CreateTest do
  use ExMon.DataCase

  alias ExMon.{Repo, Trainer}
  alias Trainer.Create

  describe "call/1" do
    test "when all params are valid, creates a trainer" do
      params = %{name: "Guilherme", password: "123456"}
      count_before = Repo.aggregate(Trainer, :count)

      response = Create.call(params)
      count_after = Repo.aggregate(Trainer, :count)

      assert {:ok, %Trainer{name: "Guilherme"}} = response
      assert count_after > count_before
    end

    test "when some params is invalid, don't create a trainer" do
      params = %{name: "Guilherme"}

      response = Create.call(params)

      assert {:error, changeset} = response
      assert errors_on(changeset) == %{password: ["can't be blank"]}
    end
  end
end
