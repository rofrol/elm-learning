-- https://sporto.gitbooks.io/web-apps-with-elm/content/signals/introduction.html

import Html
import Mouse

view : Int -> Html.Html
view x =
  Html.text (toString x)

main : Signal.Signal Html.Html
main =
  Signal.map view Mouse.x
