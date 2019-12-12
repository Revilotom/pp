import List
import Html
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

-- main = Html.text ("Hello World!\n" ++ (printTree 5))

-- main = Html.text ("Hello World!\n" ++ Debug.toString(getTree 5))

pt: Int -> Int -> Int
pt index row =
    let _ = Debug.log "index" index in
    let _ = Debug.log "row" row in
    if (index <= 0) || (row <= 1) || (index == row - 1) then 1
    else (pt (index-1) (row-1)) + (pt (index) (row-1))

getRow: Int -> List Int
getRow r = List.map (\x -> pt x r)(List.range 0 (r-1))

getTree: Int -> List (List Int)
getTree r = List.reverse (List.map (\x -> getRow x) (List.reverse (List.range 1 r)))

printTree: Int -> String
printTree r = String.join "\n" (List.map (\il -> Debug.toString il) (getTree r))








-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
  { rows : String
  }


init : Model
init =
  Model "5"



-- UPDATE


type Msg
  = Rows String



update : Msg -> Model -> Model
update msg model =
  case msg of
    Rows rows ->
      { model | rows = rows }

-- VIEW



view : Model -> Html Msg
view model =
  div []
  [
    input [ value model.rows, onInput Rows ] [],

    ul []
        (List.map (\l -> li [] [ text (Debug.toString l)]) (getTree (Maybe.withDefault 5 (String.toInt model.rows))))
  ]
    