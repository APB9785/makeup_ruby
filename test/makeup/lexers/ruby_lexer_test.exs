defmodule Makeup.Lexers.RubyLexerTest do
  use ExUnit.Case, async: true

  use ExUnitProperties

  alias Makeup.Registry
  alias Makeup.Lexers.RubyLexer
  alias Makeup.Lexer.Postprocess

  describe "registration" do
    test "fetching the lexer by name" do
      assert {:ok, {RubyLexer, []}} == Registry.fetch_lexer_by_name("ruby")
    end

    test "fetching the lexer by extension" do
      assert {:ok, {RubyLexer, []}} == Registry.fetch_lexer_by_extension("rb")
    end
  end

  describe "lex/1" do
    test "lexing an empty string" do
      assert [] == lex("")
    end

    property "lexing a string of plain text" do
      check all text <- line() do
        assert [{:text, %{}, ^text}] = lex(text)
      end
    end

    test "multiple lines" do
      text = """
      { "foo" => "bar" }
      + inserted
      - deleted
      > inserted
      < deleted
      """

      lexed =
        text
        |> lex()
        |> Enum.reject(fn {type, _, _} -> type == :whitespace end)

      assert [
               {:text, %{}, "{ \"foo\" => \"bar\" }"},
               {:text, %{}, "+ inserted"},
               {:text, %{}, "- deleted"},
               {:text, %{}, "> inserted"},
               {:text, %{}, "< deleted"}
             ] = lexed
    end
  end

  defp lex(text) do
    text
    |> RubyLexer.lex(group_prefix: "group")
    |> Postprocess.token_values_to_binaries()
    |> Enum.map(fn {type, meta, value} -> {type, Map.delete(meta, :language), value} end)
  end

  # Properties

  defp line do
    gen all text <- string(:alphanumeric), text != "" do
      text
    end
  end
end
