defmodule CursoElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :curso_elixir,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      # mod: {CursoElixir.Application, []},
      extra_applications: [:logger, :httpoison]
      # extra_applications: [:logger, :debug, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poison, "~> 3.1"},
      {:httpoison, "~> 1.7"},
      {:quantum, "~> 3.0"},
      {:timex, "~> 3.0"}

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
