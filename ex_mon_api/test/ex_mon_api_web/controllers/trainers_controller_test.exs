defmodule ExMonWeb.TrainersControllerTest do
  use ExMonWeb.ConnCase

  alias ExMon.Trainer

  describe "show/2" do
    test "when there is a trainer with the given id, returns the trainer", %{conn: conn} do
      # arrange
      params = %{name: "Guilherme", password: "123456"}
      {:ok, %Trainer{id: id}} = ExMon.create_trainer(params)

      # act
      response =
        conn
        |> get(Routes.trainers_path(conn, :show, id))
        |> json_response(:ok)

      # assert
      assert %{"id" => _id, "inserted_at" => _inserted_at, "name" => "Guilherme"} = response
    end

    test "when there is an error, returns the error", %{conn: conn} do
      # act
      response =
        conn
        |> get(Routes.trainers_path(conn, :show, "1234"))
        |> json_response(:bad_request)

      # assert
      assert %{"message" => "Invalid ID format!"} == response
    end
  end
end
