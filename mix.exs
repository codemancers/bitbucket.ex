defmodule Bitbucket.MixProject do
  use Mix.Project

  def project do
    [
      app: :bitbucket,
      version: "0.1.0",
      build_path: "_build",
      config_path: "config/config.exs",
      deps_path: "deps",
      lockfile: ".mix.lock",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Bitbucket",
      docs: [
        source_ref: "v#{@version}",
        main: "overview",
      ],
      source_url: "https://github.com/code-mancers/bitbucket.ex",
      homepage_url: "https://github.com/code-mancers/bitbucket.ex",
      description: """
      Elixir lib for Bitbucket v2.0 APIs.
      """
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpotion, "~> 3.0.0"},
      {:poison, "~> 3.1.0"}
    ]
  end
end
