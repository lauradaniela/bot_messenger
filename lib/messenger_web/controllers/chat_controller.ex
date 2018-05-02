defmodule Messenger.ChatController do
  use FacebookMessenger.Phoenix.Controller

  import FacebookMessenger.Builder

  alias FacebookMessenger.{Response, Sender}

  def message_received(msg \\ "Hola esta funcionando") do
    text = FacebookMessenger.Response.message_texts(msg) |> hd
    sender = FacebookMessenger.Response.message_senders(msg) |> hd
    FacebookMessenger.Sender.send(sender, text)
  end
end
