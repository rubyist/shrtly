defmodule Shrtly.Shortener.ShortCode do
  def generate(n) do
    Base.encode64(:binary.encode_unsigned(n), padding: false)
  end
end

defmodule Shrtly.Shortener.FunCode do
  @chars  "😀😃😄😁😆😂😅🤣🥲😊😇🙂🙃😉😌😍🥰😘😗😙😚😋😛😝😜🤪🤨🧐🤓😎🥸🤩"
  @len String.length(@chars)

  def generate(n), do: generate(n, "")
  def generate(0, ""), do: String.at(@chars, 0)
  def generate(0, hash), do: hash
  def generate(n, hash) do
    char = String.at(@chars, rem(n, @len))
    generate(div(n, @len), hash <> char)
  end
end
