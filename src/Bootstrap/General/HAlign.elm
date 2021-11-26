module Bootstrap.General.HAlign exposing 
  ( leftXs, leftSm, leftMd, leftLg, leftXl, leftXxl, 
  centerXs, centerSm, centerMd, centerLg, centerXl, centerXxl,
  rightXs, rightSm, rightMd, rightLg, rightXl, rightXxl,
  aroundXs, aroundSm, aroundMd, aroundLg, aroundXl, aroundXxl,
  betweenXs, betweenSm, betweenMd, betweenLg, betweenXl, betweenXxl,
  HAlign
  )

{-| General utility for creating a Horizontal alignment option (i.e. flex-justify-)

@docs leftXs, leftSm, leftMd, leftLg, leftXl, leftXxl,
centerXs, centerSm, centerMd, centerLg, centerXl, centerXxl,
rightXs, rightSm, rightMd, rightLg, rightXl, rightXxl,
aroundXs, aroundSm, aroundMd, aroundLg, aroundXl, aroundXxl,
betweenXs, betweenSm, betweenMd, betweenLg, betweenXl, betweenXxl,
HAlign

-}

import Bootstrap.General.Internal as Internal exposing (HorizontalAlign(..), ScreenSize(..))


{-| Internal representation of a Horizontal alignment option.
-}
type alias HAlign =
    Internal.HAlign


{-| -}
leftXs : HAlign
leftXs =
    Internal.HAlign XS Left


{-| -}
leftSm : HAlign
leftSm =
    Internal.HAlign SM Left


{-| -}
leftMd : HAlign
leftMd =
    Internal.HAlign MD Left


{-| -}
leftLg : HAlign
leftLg =
    Internal.HAlign LG Left


{-| -}
leftXl : HAlign
leftXl =
    Internal.HAlign XL Left

{-| -}
leftXxl : HAlign
leftXxl =
    Internal.HAlign XXL Left


{-| -}
centerXs : HAlign
centerXs =
    Internal.HAlign XS Center


{-| -}
centerSm : HAlign
centerSm =
    Internal.HAlign SM Center


{-| -}
centerMd : HAlign
centerMd =
    Internal.HAlign MD Center


{-| -}
centerLg : HAlign
centerLg =
    Internal.HAlign LG Center


{-| -}
centerXl : HAlign
centerXl =
    Internal.HAlign XL Center

{-| -}
centerXxl : HAlign
centerXxl =
    Internal.HAlign XXL Center

{-| -}
rightXs : HAlign
rightXs =
    Internal.HAlign XS Right


{-| -}
rightSm : HAlign
rightSm =
    Internal.HAlign SM Right


{-| -}
rightMd : HAlign
rightMd =
    Internal.HAlign MD Right


{-| -}
rightLg : HAlign
rightLg =
    Internal.HAlign LG Right


{-| -}
rightXl : HAlign
rightXl =
    Internal.HAlign XL Right

{-| -}
rightXxl : HAlign
rightXxl =
    Internal.HAlign XXL Right


{-| -}
aroundXs : HAlign
aroundXs =
    Internal.HAlign XS Around


{-| -}
aroundSm : HAlign
aroundSm =
    Internal.HAlign SM Around


{-| -}
aroundMd : HAlign
aroundMd =
    Internal.HAlign MD Around


{-| -}
aroundLg : HAlign
aroundLg =
    Internal.HAlign LG Around


{-| -}
aroundXl : HAlign
aroundXl =
    Internal.HAlign XL Around


{-| -}
aroundXxl : HAlign
aroundXxl =
    Internal.HAlign XXL Around

{-| -}
betweenXs : HAlign
betweenXs =
    Internal.HAlign XS Between


{-| -}
betweenSm : HAlign
betweenSm =
    Internal.HAlign SM Between


{-| -}
betweenMd : HAlign
betweenMd =
    Internal.HAlign MD Between


{-| -}
betweenLg : HAlign
betweenLg =
    Internal.HAlign LG Between


{-| -}
betweenXl : HAlign
betweenXl =
    Internal.HAlign XL Between

{-| -}
betweenXxl : HAlign
betweenXxl =
    Internal.HAlign XXL Between
