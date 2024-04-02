defmodule ListerBHV do
  @callback to_list(arg :: tuple() | atom() | map() | bitstring()) :: list()

  def to_list(implementor, entity) do
    implementor.to_list(entity)
  end
end

defmodule Listable do
  @behaviour ListerBHV

  @impl ListerBHV
  def to_list(listable) do
    Lister.to_list(listable)
  end
end
