defmodule Bot.Message do
  use BotWeb, :controller

  def type_message do
  end

  def message_initial(client_number) do
    data = %{
      recipient: %{
        phone_number: client_number
      },
      message: "Este es tu primer contacto"
    }
  end
end
