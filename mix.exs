defmodule Newsapi.Mixfile do
  use Mix.Project

  def project do
    [app: :newsapi,
     description: "Simple client to retrieve data from newsapi.org",
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     package: package()]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp package() do
    [
      name: "newsapi",
      files: ["lib", "mix.exs"],
      maintainers: ["Enrique Piña Monserrat"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/LordFeratum/newsapiex"}
    ]
  end
 
  defp deps do
    [
      {:httpoison, "~> 0.8.0"},
      {:poison, ">= 1.0.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
