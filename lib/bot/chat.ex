defmodule Bot.Chat do
  use BotWeb, :controller

  alias Bot.Clients
  alias Bot.Clients.User
  alias Bot.Message

  def respond_to_message(message, sender_id) do
    case save_user(sender_id) do
      {:ok, user} ->
        data = %{
          recipient: %{
            id: sender_id
          },
          message: Message.type_message(message)
        }
        |> Poison.encode!

        send_message(data)
    end
  end

  def send_message(data) do
    facebook_request_url("messages", access_token_params())
    |> HTTPoison.post(data, ["Content-Type": "application/json"], stream_to: self())
  end

  def message_initial(telefono) do
    data = %{
      recipient: %{
        phone_number: telefono
      },
      message: Message.first_message()
    }
    |> Poison.encode!

    facebook_request_url("messages", access_token_params())
    |> HTTPoison.post(data, ["Content-Type": "application/json"], stream_to: self())
  end

  defp facebook_request_url(path, params) do
    "https://graph.facebook.com/v3.0/me/#{path}?#{params}"
  end

  defp access_token_params do
    %{
      access_token: System.get_env("TOKEN_PAGE")
    }
    |> URI.encode_query()
  end

  defp save_user(sender_id) do
    case Clients.get_user_by_psid(sender_id) do
      nil ->
        Clients.create_user(%{psid: sender_id})
      user ->
        {:ok, user}
    end
  end

end
