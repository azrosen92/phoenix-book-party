defmodule BookParty.WelcomeController do
    use BookParty.Web, :controller

    def index(conn, _params) do
        render conn, "index.html"
    end

    def signup(conn, %{"email" => email}) do

    end
end