module Main exposing (..)

import Browser

import Css exposing (..)
import Css.Global as CssGlobal

import Html
import Html.Styled exposing (Html, div, button, text)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)


-- Global CSS Theme
theme : 
  { primary : Color
  , secondary : Color
  , font : Style
  , fontColor : Color
  , fontSize : Float
  }
theme =
  { primary = hex "360036"
  , secondary = hex "660066"
  , fontColor = hex "FDF6E3"
  , fontSize = 16
  , font = fontFamilies [ "Lucida Console", "Monaco", "monospace" ]
  }


-- MAIN
main : Platform.Program () Model Msg
main = 
  Browser.document 
    { init = init
    , update = update
    , view = outerView
    , subscriptions = subscriptions
    }


-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model = 
  Sub.none


-- MODEL
type alias Model = 
  { content : String
  }


-- Initial state
init : flags -> (Model, Cmd Msg)
init _ = 
  ( 
    { content = ""
    }
    , Cmd.none
  )


-- UPDATE
type Msg
  = Change String

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Change str -> 
      ( { model | content = str }, Cmd.none )  


-- OUTER VIEW
outerView : Model -> 
  { body : List (Html.Html Msg)
  , title : String 
  }
outerView model = 
  { title = "Web title"
    , body = List.map Html.Styled.toUnstyled 
      [ CssGlobal.global 
        [ CssGlobal.body 
          [ backgroundColor theme.primary 
          ] 
        ]
      , view model
      ]
  }


-- VIEW
view : Model -> Html Msg
view model = 
  div 
    [ -- Attributes go here
    ]
    [ -- Content goes here
    ]
