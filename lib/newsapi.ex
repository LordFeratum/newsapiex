defmodule Newsapi do
  @moduledoc """
  Documentation for Newsapi.
  """

  @api_url "https://newsapi.org/v1"

  def get_sources(language) do
    build_source_url(language)
    |> get_json
    |> decode_response
    |> process_source_response
  end

  def get_articles(api_key, source, language, sort \\ "latest") do
    build_article_url(api_key, source, language, sort)
    |> get_json
    |> decode_response
    |> process_article_response
  end

  defp build_article_url(api_key, source, language, sort) do
    "#{@api_url}/articles?source=#{source}&language=#{language}&apiKey=#{api_key}&sortBy=#{sort}"
  end

  defp build_source_url(language) do
    "#{@api_url}/sources?langauge=#{language}"
  end

  defp get_json(url) do
    HTTPoison.get!(url).body
  end

  defp decode_response(response) do
    Poison.decode!(response)
  end

  defp process_source_response(json) do
    json["sources"]
  end

  defp process_article_response(json) do
    json["articles"]
  end

end
