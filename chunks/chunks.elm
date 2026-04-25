
renderMaybe : Maybe a -> (a -> Html msg) -> Html msg
renderMaybe value f =
  Maybe.map f value |> Maybe.withDefault (Html.text "")

-------------------------------------------------

renderIf : Bool -> Html msg -> Html msg
renderIf condition content =
    ifelse condition content (Html.text "")

ifelse : Bool -> a -> a -> a
ifelse condition v1 v2 =
    if condition then
        v1

    else
        v2

