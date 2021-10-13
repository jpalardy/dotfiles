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
    elm review

cd ~/.github; git clone git@github.com:jfmengels/elm-review-unused.git
elm-review --config ~/.github/elm-review-unused/example/

-------------------------------------------------
--}
