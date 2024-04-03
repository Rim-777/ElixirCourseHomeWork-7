defprotocol Lister do
  def to_list(term)
end

defimpl Lister, for: String do
  def to_list(string) do
    String.split(string, "", trim: true)
  end
end

defimpl Lister, for: BitString do
  def to_list(bitstring) when is_binary(bitstring) do
    String.split(bitstring, "", trim: true)
  end

  def to_list(bitstring) do
    for <<bit::1 <- bitstring>>, do: bit
  end
end

defimpl Lister, for: Atom do
  def to_list(atom) do
    atom
    |> to_string()
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
      |> Enum.to_list()
    end
  end
end
