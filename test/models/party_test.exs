defmodule BookParty.PartyTest do
  use BookParty.ModelCase

  alias BookParty.Party

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Party.changeset(%Party{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Party.changeset(%Party{}, @invalid_attrs)
    refute changeset.valid?
  end
end
