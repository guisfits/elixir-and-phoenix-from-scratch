defmodule FizzBuzz do
  def build(file_name) do

    file_name
    |> File.read()
    |> handle_file_read()

    ## SWITCH CASE
    # case File.read(file_name) do
    #   {:ok, result} -> result
    #   {:error, msg} -> msg
    # end
  end

  defp handle_file_read({:ok, result}) do
    result =
      result
      |> String.replace("\n", "")
      |> String.split(",") # 1,2,3,4,5 -> [1,2,3,4,5]
      |> Enum.map(&convert_and_evaluate_numbers/1)
      # |> Enum.map(fn number -> String.to_integer(number) end)

    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(elem) do
    elem
    |> String.to_integer()
    |> evaluate_numbers?()
  end

  defp evaluate_numbers?(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizz_buzz
  defp evaluate_numbers?(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers?(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers?(number), do: number

end
