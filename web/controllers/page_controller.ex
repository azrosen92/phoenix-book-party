defmodule BookParty.PageController do
  use BookParty.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
