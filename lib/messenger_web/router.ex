defmodule MessengerWeb.Router do
  use MessengerWeb, :router
  use FacebookMessenger.Phoenix.Router

  facebook_routes "/api/webhook", Messenger.ChatController

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

  scope "/api", MessengerWeb do
    pipe_through :api
  end

end
