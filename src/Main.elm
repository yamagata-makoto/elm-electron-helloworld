module Main exposing (Msg(..), main, update, view)

import Browser
import Html exposing (Html, button, div, text, p)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = 0, update = update, view = view }


type Msg
    = Increment
    | Decrement
    | Reset


update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1

        Reset ->
            0


view model =
    div []
        [ p []   [ text "Hello world from Elm!" ]
        , button [ onClick Increment ] [ text "+" ]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Reset ] [ text "Reset" ]
        ]
