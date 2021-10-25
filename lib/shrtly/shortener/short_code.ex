defmodule Shrtly.Shortener.ShortCode do
  def generate(n) do
    Base.encode64(:binary.encode_unsigned(n), padding: false)
  end
end
