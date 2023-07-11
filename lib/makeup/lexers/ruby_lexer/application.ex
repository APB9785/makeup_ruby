defmodule Makeup.Lexers.RubyLexer.Application do
  @moduledoc false

  use Application

  alias Makeup.Registry
  alias Makeup.Lexers.RubyLexer

  # https://pygments.org/docs/lexers/#lexers-for-ruby-and-related-languages
  def start(_type, _args) do
    Registry.register_lexer(RubyLexer, options: [], names: ["ruby"], extensions: ["rb"])
    Supervisor.start_link([], strategy: :one_for_one)
  end
end
