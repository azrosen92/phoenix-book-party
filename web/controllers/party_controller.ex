defmodule BookParty.PartyController do
  use BookParty.Web, :controller

  alias BookParty.Party

  def index(conn, _params) do
    parties = Repo.all(Party)
    render(conn, "index.html", parties: parties)
  end

  def new(conn, _params) do
    changeset = Party.changeset(%Party{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"party" => party_params}) do
    changeset = Party.changeset(%Party{}, party_params)

    case Repo.insert(changeset) do
      {:ok, _party} ->
        conn
        |> put_flash(:info, "Party created successfully.")
        |> redirect(to: party_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    party = Repo.get!(Party, id)
    render(conn, "show.html", party: party)
  end

  def edit(conn, %{"id" => id}) do
    party = Repo.get!(Party, id)
    changeset = Party.changeset(party)
    render(conn, "edit.html", party: party, changeset: changeset)
  end

  def update(conn, %{"id" => id, "party" => party_params}) do
    party = Repo.get!(Party, id)
    changeset = Party.changeset(party, party_params)

    case Repo.update(changeset) do
      {:ok, party} ->
        conn
        |> put_flash(:info, "Party updated successfully.")
        |> redirect(to: party_path(conn, :show, party))
      {:error, changeset} ->
        render(conn, "edit.html", party: party, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    party = Repo.get!(Party, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(party)

    conn
    |> put_flash(:info, "Party deleted successfully.")
    |> redirect(to: party_path(conn, :index))
  end
end
