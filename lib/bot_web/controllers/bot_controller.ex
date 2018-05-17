defmodule BotWeb.BotController do
  use BotWeb, :controller

  def webhook(conn, %{ "hub.challenge" => challenge, "hub.verify_token" => token, "hub.mode" => mode } ) do

    verify_token = System.get_env("TOKEN_SECRET")
    if (token == verify_token) do
      challenge = challenge
                  |> String.to_integer()
      render conn, "webhook.json", challenge: challenge
    else
      send_resp(conn, 403, "Entrypoint Unauthorized")
    end

  end

  def message(conn, %{"entry" => [%{"messaging" => [%{"message" => %{"text" => message}, "sender" => %{"id" => sender_id}}]}]}) do
    Bot.Chat.respond_to_message(message, sender_id)
    conn
    |> send_resp(200, "ok")
  end

  def message(conn, _params) do
    Bot.Chat.message_initial()
    conn
    |> send_resp(200, "ok")
  end
end
