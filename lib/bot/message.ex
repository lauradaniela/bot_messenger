defmodule Bot.Message do
  use BotWeb, :controller

  def type_message(message) do
    if String.match?(message, ~r/contraseña|password/) do
      IO.puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      message_password()
    end
  end

  def message_initial() do
    %{
      attachment: %{
        type: "template",
        payload: %{
          template_type: "button",
          text: "Bienvenido a Advocates, te invitamos a dirigirte a nuestra página",
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
  def message_password() do
    %{
      attachment: %{
        type: "template",
        payload: %{
          template_type: "button",
          text: "Si has olvidado tu contraseña visita nuestra pagina y selecciona la opción ¿olvido su contraseña?",
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
end
