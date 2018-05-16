defmodule BotWeb.BotController do
  use BotWeb, :controller

  def webhook(conn, %{ "hub.challenge" => challenge } ) do
    verify_token = System.get_env("TOKEN_SECRET")
    challenge = challenge
                |> String.to_integer()
    render conn, "webhook.json", challenge: challenge
  end

  #def message(conn, %{"entry" => [%{"messaging" => [%{"message" => %{"text" => message}, "sender" => %{"id" => sender_id}}]}]}) do
  def message(conn, params) do
    IO.puts("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
    IO.inspect(params)
    IO.puts("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")

    #Bot.Chat.respond_to_message(message, sender_id)
    #conn
    #|> send_resp(200, "ok")
    send_resp(conn, 200, "ok")
  end
end
