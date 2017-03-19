defmodule BookParty.UserParty do
  use BookParty.Web, :model

  schema "user_parties" do
    belongs_to :user, BookParty.User
    belongs_to :party, BookParty.Party

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
