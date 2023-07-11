# MakeupRuby

A [Makeup](https://github.com/elixir-makeup/makeup/) lexer for Ruby.

This is a WIP: currently every token is a `:text` no matter the content.

## Installation

Add `makeup_ruby` to your list of dependencies in mix.exs:

```elixir
def deps do
  [
    {:makeup_ruby, github: "BeaconCMS/makeup_ruby"}
  ]
end
```

The lexer will automatically register itself with Makeup for `ruby` as well as `.rb` extension.

## Acknowledgements

Based on [makeup_text](https://github.com/BeaconCMS/makeup_text) which is based on [makeup_diff](https://github.com/elixir-makeup/makeup_diff).
