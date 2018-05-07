defmodule Bot.Chat do
  use BotWeb, :controller

  def respond_to_message(message, sender_id) do
    data = %{
      recipient: %{
        id: sender_id
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
      access_token: "EAAPJ6djjwkMBAI8G94X0CG6QVheIDx3KIZAQOhhKpxXzEzX3GjKYAeLfjsxV0o6VvGwlLcLyUP7oi0E52oauZBKfQ2tw1yLyVO2erjW6dVJZBetlJtZCEZBZCOBIMy4Mz5Nyl14buXy6uFCMFZBS0Nw4WRH8hguI0QOnZAJo2oO4swZDZD"
    }
    |> URI.encode_query()
  end

  defp message_response([]) do
    %{
      text: "Sorry! I couldn't find any podcasts with that. How about \"Serial\"?"
    }
  end

end
