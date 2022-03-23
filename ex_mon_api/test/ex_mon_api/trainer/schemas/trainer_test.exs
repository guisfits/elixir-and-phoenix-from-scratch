defmodule ExMon.TrainerTest do
  use ExMon.DataCase

  alias ExMon.Trainer

  describe "changeset/1" do
    test "when all params are valid, return valid changeset" do
      params = %{name: "Guilherme", password: "123456"}

      response = Trainer.changeset(params)

      expected_response = %Ecto.Changeset{
        changes: %{
          name: "Guilherme",
          password: "123456"
        },
        errors: [],
        data: %ExMon.Trainer{},
        valid?: true
      }

      assert expected_response = response
    end

    test "when some params are invalid, return invalid changeset" do
      params = %{name: "Guilherme"}

      response = Trainer.changeset(params)

      expected_response = %Ecto.Changeset{
        changes: %{
          name: "Guilherme"
        },
        data: %ExMon.Trainer{},
        valid?: false
      }

      assert expected_response = response
      assert errors_on(response) == %{password: ["can't be blank"]}
    end
  end

  describe "build/1" do
    test "when all params are valid, returns a trainer struct" do
      params = %{name: "Guilherme", password: "123456"}

      response = Trainer.build(params)

      assert {:ok, %Trainer{name: "Guilherme", password: "123456"}} = response
    end

    test "when some params are invalid, returns a error struct" do
      params = %{password: "123456"}

      {:error, response} = Trainer.build(params)

      assert %Ecto.Changeset{valid?: false} = response
      assert errors_on(response) == %{name: ["can't be blank"]}
    end
  end
end
