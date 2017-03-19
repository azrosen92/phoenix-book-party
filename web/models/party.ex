defmodule BookParty.Party do
  use BookParty.Web, :model

  schema "parties" do
    many_to_many :users, User, join_through: "user_parties"
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
