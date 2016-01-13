import Html exposing (text, div, ul, li, button)
import Markdown
import String.Interpolate exposing(interpolate)
import Html.Events exposing (onClick)
import StartApp.Simple as StartApp

model: number
model = 0

view: Signal.Address Action -> a -> Html.Html
view address model =
  div [] [
    text "Hello, world",
    ul []
    [ li [] [text "one"]
    , li [] [text "two"]
    ],
    Markdown.toHtml markdown,
    text (toString (double 2)),
    div [] [ text (toString list) ],
    text a,
    Html.p [] [text output],
    div []
    [ button [ onClick address Decrement ] [ text "-" ]
    , div [] [ text (toString model)]
    , button [ onClick address Increment ] [ text "+" ]
    ]
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
  if powerLevel > 9000 then "Ups, over 9000!!!" else "meh"

a : String
a = over9000 9001

output : String
output =
  interpolate "My name is {0} {1}" ["Luke", "Westby"]

type Action = Increment | Decrement

update: Action -> number -> number
update action model =
  case action of
    Increment -> model + 1
    Decrement -> model - 1

main: Signal Html.Html
main = StartApp.start { model = model, view = view, update = update }
