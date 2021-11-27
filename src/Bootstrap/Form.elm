module Bootstrap.Form exposing
    ( form, formInline
    , group, label, Option, attrs
    , colLabel, colLabelSm, colLabelLg, Col
    , validFeedback, invalidFeedback
    , help, helpInline
    , renderCol
    )

{-| Bootstrap provides several form control styles, layout options, and custom components for creating a wide variety of forms.


# Forms

@docs form, formInline


# Groups

Use form groups to group items together (label + input is a typical simple example)

@docs group, label, Option, attrs


# Grid layouts

@docs colLabel, colLabelSm, colLabelLg, Col


# Validation

@docs validFeedback, invalidFeedback


# Handy helpers

@docs help, helpInline

-}

import Bootstrap.Grid.Col as Col
import Bootstrap.Grid.Internal as GridInternal
import Bootstrap.Grid.Row as Row
import Html
import Html.Attributes as Attributes


{-| Opaque type representing a column in a form row
-}
type Col msg
    = Col
        { elemFn : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
        , options : List (Col.Option msg)
        , children : List (Html.Html msg)
        }


{-| Opaque type representing options for customing form groups.
-}
type Option msg
    = Attrs (List (Html.Attribute msg))


type alias Options msg =
    { attributes : List (Html.Attribute msg)
    }


{-| Create an Html form element
-}
form : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
form attributes children =
    Html.form
        attributes
        children


{-| Create an inline form for placing elements horizontally.

**Note**: You should stick to inline elements to get the effect you are probably expecting!

-}
formInline : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
formInline attributes =
    form (Attributes.class "deprecated" :: attributes)


{-| 
DEPRECATED in BS5. Use Grid.col and other layout tools.

_ Use the group function to create a grouping of related form elements.
It just creates a div container with a `form-group` Bootstrap class.
Typically you use this for vertically laid out forms. _

  - `options` List of [`options`](#Option) for customizing the group
  - `children` List of children

-}
group : List (Option msg) -> List (Html.Html msg) -> Html.Html msg
group options children =
    Html.div
        (toAttributes options)
        children


{-| Create a form control label. Suitable for use in form groups.

  - `attributes` List of attributes
  - `children` List of child elements

-}
label : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
label attributes children =
    Html.label
        (Attributes.class "form-label" :: attributes)
        children


{-| Creates a block level text element, suitable for providing context related help text in form groups.
-}
help : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
help attributes children =
    Html.small
        (Attributes.class "form-text text-muted" :: attributes)
        children


{-| Creates an inline text element, suitable for providing context related help text for inputs.
-}
helpInline : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
helpInline attributes children =
    Html.small
        (Attributes.class "text-muted" :: attributes)
        children


{-| Function to provide validation feedback information for valid inputs
-}
validFeedback :
    List (Html.Attribute msg)
    -> List (Html.Html msg)
    -> Html.Html msg
validFeedback attributes children =
    Html.div
        (Attributes.class "valid-feedback" :: attributes)
        children


{-| Function to provide validation feedback information for invalid inputs
-}
invalidFeedback :
    List (Html.Attribute msg)
    -> List (Html.Html msg)
    -> Html.Html msg
invalidFeedback attributes children =
    Html.div
        (Attributes.class "invalid-feedback" :: attributes)
        children


toAttributes : List (Option msg) -> List (Html.Attribute msg)
toAttributes modifiers =
    let
        options =
            List.foldl applyModifier defaultOptions modifiers
    in
    [ Attributes.class "form-group" ]
        ++ options.attributes


defaultOptions : Options msg
defaultOptions =
    { attributes = []
    }


applyModifier : Option msg -> Options msg -> Options msg
applyModifier modifier options =
    case modifier of
        Attrs value ->
            { options | attributes = options.attributes ++ value }


{-| Use this function to handle any Html.Attribute option you wish for your form
group.
-}
attrs : List (Html.Attribute msg) -> Option msg
attrs =
    Attrs



{- Grid related functions -}



{-| Create a label element as a grid column to be used in a [`form row`](#row).
Handy for use in horizontal form in various shapes.

  - `options` List of Bootstrap.Grid.Col options for layout customization
  - `children` List of child elements

-}
colLabel : List (Col.Option msg) -> List (Html.Html msg) -> Col msg
colLabel options children =
    Col
        { elemFn = Html.label
        , options = Col.attrs [ Attributes.class "col-form-label" ] :: options
        , children = children
        }


{-| Create a shorter (height) [`colLabel`](#colLabel)
-}
colLabelSm :
    List (GridInternal.ColOption msg)
    -> List (Html.Html msg)
    -> Col msg
colLabelSm options =
    colLabel (Col.attrs [ Attributes.class "col-form-label-sm" ] :: options)


{-| Create a taller [`colLabel`](#colLabel)
-}
colLabelLg :
    List (GridInternal.ColOption msg)
    -> List (Html.Html msg)
    -> Col msg
colLabelLg options =
    colLabel (Col.attrs [ Attributes.class "col-form-label-lg" ] :: options)


renderCol : Col msg -> Html.Html msg
renderCol (Col { elemFn, options, children }) =
    elemFn
        (GridInternal.colAttributes options)
        children
