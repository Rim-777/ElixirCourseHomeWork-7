defmodule ListerTest do
  use ExUnit.Case

  @atom :some_atom
  @listed_atom ["s", "o", "m", "e", "_", "a", "t", "o", "m"]

  @string "some string"
  @listed_string ["s", "o", "m", "e", " ", "s", "t", "r", "i", "n", "g"]

  @tuple {"Some", "tuple"}
  @listed_tuple ["Some", "tuple"]

  @map %{"Some" => "Map", with: :beer}
  @listed_map [:with, :beer, "Some", "Map"]

  @keyword_struct %KeywordLister{}
  @listed_keyword_struct [first_name: "Yasha", last_name: "Berhman"]

  test "list listable types with protocol" do
    assert Lister.to_list(@atom) == @listed_atom
    assert Lister.to_list(@string) == @listed_string
    assert Lister.to_list(@tuple) == @listed_tuple
    assert Lister.to_list(@map) == @listed_map
    assert Lister.to_list(@keyword_struct) == @listed_keyword_struct
  end

  test "list listable types with behaviour" do
    assert ListerBHV.to_list(Listable, @atom) == @listed_atom
    assert ListerBHV.to_list(Listable, @string) == @listed_string
    assert ListerBHV.to_list(Listable, @tuple) == @listed_tuple
    assert ListerBHV.to_list(Listable, @map) == @listed_map
    assert ListerBHV.to_list(Listable, @keyword_struct) == @listed_keyword_struct
  end
end
