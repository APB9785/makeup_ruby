defmodule MakeupRuby.MixProject do
  use Mix.Project

  def project do
    [
      app: :makeup_ruby,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description(),
      docs: [
        main: "readme",
        extras: [
          "README.md"
        ]
      ]
    ]
  end

  defp description do
    """
    Ruby lexer for the Makeup syntax highlighter.
    """
  end

  defp package do
    [
      name: :makeup_ruby,
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/BeaconCMS/makeup_ruby"}
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Makeup.Lexers.RubyLexer.Application, []}
    ]
  end

  defp deps do
    [
      {:makeup, "~> 1.0"},
      {:stream_data, "~> 0.5", only: [:dev, :test]},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end
end
