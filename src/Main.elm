module Main exposing (..)

import Html exposing (br, button, div, text)
import Html.Events exposing (onClick)
import Browser


main =
    Browser.sandbox
        { init = initialModel
        , update = update
        , view = view
        }


type Msg
    = Increment
    | Decrement

type alias Model = Int

initialModel : Model
initialModel =
    0

view : Int -> Html.Html Msg
view model =
    div []
        [ button [ onClick Increment ] [ text "+" ]
        , br [] []
        , text <| String.fromInt model
        , br [] []
        , button [ onClick Decrement ] [ text "-" ]
        ]


update : Msg -> Int -> Int
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1
