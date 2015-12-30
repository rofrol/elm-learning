import Html exposing (text, div, ul, li)
import Markdown

main: Html.Html
main =
  div [] [
    text "Hello, world",
    ul []
    [ li [] [text "one"]
    , li [] [text "two"]
    ],
    Markdown.toHtml markdown,
    text (toString (double 2)),
    div [] [ text (toString list) ]
  ]

markdown: String
markdown = """
# one heading
- one
- two
  - sub three

"""

double: number -> number
double n = n * 2

list: List number
list = [1, 2, 3 ,4]

over9000: number -> String
over9000 powerLevel =
  if powerLevel > 9000 then "upps 9000" else "meh"

a : String
a = over9000 9001
