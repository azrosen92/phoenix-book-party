defmodule BookParty.User do
  use BookParty.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string

    many_to_many :parties, Party, join_through: "user_parties"

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email])
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
  end
end
