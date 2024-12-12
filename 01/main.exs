defmodule AdventOfCode.Y2024.Day01 do
  def format_data() do
    {:ok, content} = File.read("input.txt")

    content
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, ~r/\s+/, trim: true))
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(fn list -> Enum.map(list, &String.to_integer/1) end)
  end

  def part_one() do
    [left, right] = format_data() 

    Enum.zip(Enum.sort(left), Enum.sort(right))
    |> Enum.map(fn {a, b} -> abs(a - b) end)
    |> Enum.sum()
  end

  def part_two() do
    [left, right] = format_data() 

    Enum.reduce(left, 0, fn left_value, acc ->
      count = Map.get(Enum.frequencies(right), left_value, 0)
      acc + (left_value * count)
    end)
  end
end

AdventOfCode.Y2024.Day01.part_one() |> IO.inspect(label: "Part One")
AdventOfCode.Y2024.Day01.part_two() |> IO.inspect(label: "Part Two")
