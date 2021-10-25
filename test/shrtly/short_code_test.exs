defmodule Shrtly.ShortCodeTest do
  use Shrtly.DataCase

  describe "short codes" do
    test "encodes an integer to a short string" do
      code = Shrtly.Shortener.ShortCode.generate(1)
      assert code == "AQ"
    end
  end

  describe "fun codes" do
    test "encodes an integer to a fun string" do
      code = Shrtly.Shortener.FunCode.generate(1)
      assert code == "😃"
    end
  end
end
