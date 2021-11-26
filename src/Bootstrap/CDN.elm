module Bootstrap.CDN exposing (stylesheet, fontAwesome, javascript)

{-| A helper module for easily embedding CSS when you want to work with the library using the Elm Reactor.

@docs stylesheet, fontAwesome, javascript

-}

import Html exposing (Html, node)
import Html.Attributes exposing (href, rel)
import Html.Attributes as Attrs


{-| Allows you to embed the Bootstrap CSS as a node in your view.

    import Bootstrap.CDN

    view : Model -> Html Msg
    view model =
        div []
            [ CDN.stylesheet -- css embedded inline.
            , yourContentHere
            , navbar model
            , mainContent model
            ]

-}
stylesheet : Html msg
stylesheet =
    node "link"
        [ rel "stylesheet"
        , href "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        ]
        []


{-| Allows you to embed the Bootstrap JS as a node in your view.

    import Bootstrap.CDN

    view : Model -> Html Msg
    view model =
        div []
            [ CDN.javascript -- js embedded inline.
            , yourContentHere
            , navbar model
            , mainContent model
            ]

-}
javascript : Html msg 
javascript =
    node "script"
        [ Attrs.attribute "crossorigin" "anonymous"
        , Attrs.attribute "src"  "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        ]
        []


{-| Font Awesome can also be conveniently included as an inline node. Font Awesome is not a dependency for `elm-bootstrap`.
-}
fontAwesome : Html msg
fontAwesome =
    node "link"
        [ rel "stylesheet"
        , href "https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        ]
        []
