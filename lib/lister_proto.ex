defprotocol Lister do
  def to_list(term)
end

defimpl Lister, for: BitString do
  def to_list(string) do
    String.split(string, "", trim: true)
  end
end

defimpl Lister, for: Atom do
  def to_list(atom) do
    to_string(atom)
    |> Lister.to_list()
  end
end

defimpl Lister, for: Tuple do
  def to_list(tuple) do
    Tuple.to_list(tuple)
  end
end

defimpl Lister, for: Map do
  def to_list(map) do
    map |> Enum.flat_map(fn {k, v} -> [k, v] end)
  end
end

defmodule KeywordLister do
  defstruct first_name: "Yasha", last_name: "Berhman"

  defimpl Lister do
    def to_list(struct) do
      struct
      |> Map.from_struct()
      |> Enum.reduce([], fn pair, list -> [pair | list] end)
      |> Enum.reverse()
    end
  end
end
