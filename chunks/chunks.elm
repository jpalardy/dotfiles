module Whatever exposing (..)

{--
-------------------------------------------------
    divider
-------------------------------------------------
--}

add : Int -> Int -> Int
add x y =
    x + y

{-| subtract
-}
sub : Int -> Int -> Int
sub x y =
    x - y

{--
-------------------------------------------------
    HTTP placeholder
-------------------------------------------------
--}

Process.sleep 2000
    |> Task.perform (\_ -> Message (Ok value))

{--
-------------------------------------------------
    elm review

cd ~/.github; git clone git@github.com:jfmengels/elm-review-unused.git
elm-review --config ~/.github/elm-review-unused/example/

-- or --

elm-review init
cd review && elm install jfmengels/elm-review-unused
cp ~/.github/elm-review-unused/example/src/ReviewConfig.elm src/ReviewConfig.elm

-------------------------------------------------
--}

-- -------------------------------------------------

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)

type Msg
    = NoOp

type alias Model =
    { value : String }

init : () -> ( Model, Cmd Msg )
init _ =
    ( { value = "nothing yet" }, Cmd.none )

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none

view : Model -> Html Msg
view model =
    text model.value

main : Program () Model Msg
main =
    Browser.element
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }

{--
-------------------------------------------------
    ports
-------------------------------------------------
--}

-- => in
port portName : (Decode.Value -> msg) -> Sub msg

-- subscriptions _ =
--     let
--         decodeTo : (_ -> Msg) -> Decode.Value -> Msg
--         decodeTo msg value =
--             case Decode.decodeValue _ value of
--                 Ok _ ->
--                     msg _
--
--                 Err error ->
--                     _
--     in
--     Sub.batch
--         [ ...
--         , portName (decodeTo MessageName)
--         , ...
--         ]
