defmodule BookParty.Router do
  use BookParty.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BookParty do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/welcome", UserController, :new
    post "/signup", WelcomeController, :signup

    resources "/users", UserController
    resources "/parties", PartyController
    resources "/emails", EmailController
  end

  # Other scopes may use custom stacks.
  # scope "/api", BookParty do
  #   pipe_through :api
  # end
end
