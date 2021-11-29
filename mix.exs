defmodule XT.MixProject do
  use Mix.Project

  def project do
    [
      app: :xt,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      source_url: "https://github.com/cdesch/xt",
      homepage_url: "https://github.com/cdesch/xt",

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
      {:ex_doc, "~> 0.24", only: :dev, runtime: false},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.10", only: :test},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end


  defp description() do
    "A few sentences (a paragraph) describing the project."
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "ex_tool_chest",
      # These are the default files included in the package
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/cdesch/ex_tool_chest"}
    ]
  end
end
