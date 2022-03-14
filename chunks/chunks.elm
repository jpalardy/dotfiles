module Whatever exposing (..)

{--
-------------------------------------------------
    HTTP placeholder
-------------------------------------------------
--}

Process.sleep 2000
    |> Task.perform (\_ -> Message (Ok value))

-- -------------------------------------------------

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
