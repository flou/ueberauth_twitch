defmodule UeberauthTwitch.Mixfile do
  use Mix.Project

  @version "0.0.1"

  def project do
    [app: :ueberauth_twitch,
     version: @version,
     name: "Ueberauth Twitch",
     package: package(),
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     source_url: "https://github.com/flou/ueberauth_twitch",
     homepage_url: "https://github.com/flou/ueberauth_twitch",
     description: description(),
     deps: deps(),
     docs: docs()]
  end

  def application do
    [applications: [:logger, :ueberauth, :oauth2]]
  end

  defp deps do
    [{:ueberauth, "~> 0.4"},
     {:oauth2, "~> 0.9"},
     {:poison, "~> 1.3 or ~> 2.0"},

     # docs dependencies
     {:earmark, ">= 0.0.0", only: :dev},
     {:ex_doc, "~> 0.3", only: :dev},
     {:credo, "~> 0.6", only: [:dev, :test]},
    ]
  end

  defp docs do
    [extras: ["README.md"]]
  end

  defp description do
    "An Ueberauth strategy for using Twitch to authenticate your users."
  end

  defp package do
    [files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Lou Ferrand"],
      licenses: ["MIT"],
      links: %{"GitHub": "https://github.com/flou/ueberauth_twitch"}]
  end
end
