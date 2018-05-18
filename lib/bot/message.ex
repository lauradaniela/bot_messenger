defmodule Bot.Message do
  use BotWeb, :controller

  def type_message(message) do
    cond do
      String.match?(message, ~r/contraseña|password/) ->
        message_password()
      String.match?(message, ~r/puntos/) ->
        message_points()
      String.match?(message, ~r/esto|advocates/) ->
        message_informative()
      String.match?(message, ~r/premios|regalos|gano|premios/) ->
        message_awards()
      true ->
        any_option()
    end
  end
  def any_option() do
    %{
      text: "Bienvenido a Advocates, te invitamos a dirigirte a nuestra página",
    }
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

  def message_points() do
    %{
      attachment: %{
        type: "template",
        payload: %{
          template_type: "button",
          text: "Para consultar tus puntos ingresa a la plataforma para ver el detalle",
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

  def message_informative() do
    %{
      attachment: %{
        type: "template",
        payload: %{
          template_type: "button",
          text: "Advocates es un plataforma que te permite que tú como colaborador de la marca, puedas ser su embajador. Entra a nuestra plataforma para más información.",
          buttons: [
            %{
              type: "web_url",
              url: "https://fluvip.advocatespro.com",
              title: "Visita Advocates"
            }
          ]
        }
      }
    }
  end

  def message_awards() do
    %{
      attachment: %{
        type: "template",
        payload: %{
          template_type: "button",
          text: "Los premios son los asignados por tu empresa y se ganan participando en todas las campañas propuestas así que no esperes más para participar.",
          buttons: [
            %{
              type: "web_url",
              url: "https://fluvip.advocatespro.com",
              title: "Visita Advocates"
            }
          ]
        }
      }
    }
  end

end
