
renderMaybe : Maybe a -> (a -> Html msg) -> Html msg
renderMaybe value f =
  Maybe.map f value |> Maybe.withDefault (Html.text "")
