defmodule BotWeb.BotView do
  use BotWeb, :view

  def render("webhook.json", %{ challenge: challenge}) do
    challenge
  end
end
