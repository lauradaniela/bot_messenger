defmodule Bot.Chat do
  use BotWeb, :controller

  alias Bot.Clients
  alias Bot.Clients.User

  def respond_to_message(message, sender_id) do
    case save_user(sender_id) do
      {:ok, user} ->
        data = %{
          recipient: %{
            phone_number: "+573125657610"
          },
          message: message_normal([])
        }
        |> Poison.encode!
      
        facebook_request_url("messages", access_token_params())
        |> HTTPoison.post(data, ["Content-Type": "application/json"], stream_to: self())
    end
  end

  def message_initial() do
    data = %{
      recipient: %{
        phone_number: "+573125657610"
      },
      message: message_response([])
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

  defp message_normal([]) do
    %{
      attachment: %{
        type: "template",
        payload: %{
          template_type: "button",
          text: "Bienvenido a Advocates, te invitamos a dirigirte a nuestra pagina",
          buttons: [
            %{
              type: "web_url",
              url: "https://fluvip.advocatespro.com/users/sign_in?locale=es",
              title: "Visita Advocates"
            }
          ]
        }
      }
    }
  end

  defp message_response([]) do
    %{
      attachment: %{
        type: "template",
        payload: %{
          template_type: "button",
          text: "Bienvenida Laura",
          buttons: [
            %{
              type: "web_url",
              url: "https://fluvip.advocatespro.com/users/sign_in?locale=es",
              title: "Visita Advocates"
            }
          ]
        }
      }
    }
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
