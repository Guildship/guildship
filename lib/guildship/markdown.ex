defmodule Guildship.Markdown do
  import Earmark
  import HtmlSanitizeEx

  def markdown_to_clean_html!(md) do
    md
    |> as_html!
    |> markdown_html()
  end
end
