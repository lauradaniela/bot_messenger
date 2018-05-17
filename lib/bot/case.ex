defmodule Bot.Case do
  cases_advocates = %{
                      case1: ["olvide", "contraseña", "recuerdame", "usuario", "password", "no sé", "mi", "no se"],
                      case2: ["cuantos", "puntos", "ganado", "obtenido", "he", "que", "tengo"],
                      case3: ["que", "es", "esto", "como", "funciona", "advocates"],
                      case4: ["como", "gano", "gano", "premios", "puntos", "obtengo", "regalos"]
                    }

  def choice_case(message) do
    words = String.split(message, " ")

    for {k, v} <- cases_advocates do
      Enum.any?(v, fn(s) -> s == (Enum.map(words, fn(x) -> String.downcase(x) end) end))
    end
  end
end
