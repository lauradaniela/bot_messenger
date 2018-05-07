defmodule BotWeb.Router do
  use BotWeb, :router

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

  pipeline :bot do
    plug :accepts, ["json"]
  end

  scope "/", BotWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/bot", BotWeb do
    pipe_through :bot

    get "/webhook", BotController, :webhook
    post "/webhook", BotController, :message
  end

  ##scope "/api/v1", BotWeb do
  ##end
end
