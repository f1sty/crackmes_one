defmodule Keygenme do
  def get_key(username) do
    with username <- to_charlist(username),
         count <- length(username) do
      0..count - 1
      |> Enum.map(&get_key_letter(Enum.at(username, &1), count))
      |> to_string()
    end
  end

  defp get_key_letter(key_letter, 0) do
    key_letter
  end

  defp get_key_letter(key_letter, count) do
    case key_letter do
      ?z -> get_key_letter(?a, count - 1)
      ?Z -> get_key_letter(?A, count - 1)
      chr -> get_key_letter(chr + 1, count - 1)
    end
  end
end
