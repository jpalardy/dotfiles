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

-- or --

elm-review init
cd review && elm install jfmengels/elm-review-unused
cp ~/.github/elm-review-unused/example/src/ReviewConfig.elm src/ReviewConfig.elm

-------------------------------------------------
--}
