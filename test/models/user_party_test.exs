defmodule BookParty.UserPartyTest do
  use BookParty.ModelCase

  alias BookParty.UserParty

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = UserParty.changeset(%UserParty{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = UserParty.changeset(%UserParty{}, @invalid_attrs)
    refute changeset.valid?
  end
end
