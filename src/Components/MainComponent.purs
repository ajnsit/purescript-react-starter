module MainComponent where

import Component.Tree (tree)
import Control.Alternative (pure)
import Control.Bind (bind)
import Data.CommutativeRing ((+))
import Data.Function (const, ($))
import Data.Show (show)
import Data.Unit (Unit)
import Effect (Effect)
import React (ReactClass, ReactElement)
import React as React
import React.DOM as D
import React.DOM.Props as P

mainComponent :: ReactElement
mainComponent = D.div []
  [ D.h1 [] [D.text "Hello Purescript!!"]
  , counter 100
  , D.div [P.style {height: "400px"}] [tree]
  ]

counter :: Int -> ReactElement
counter count = React.createLeafElement (counterClass count) {}

counterView :: Int -> Effect Unit -> ReactElement
counterView count changeHandler = D.div []
  [ D.div [] [D.text (show count)]
  , D.div [] [D.button [P.onClick (const changeHandler)] [D.text "Increment"]]
  ]

counterClass :: Int -> ReactClass {}
counterClass count = React.component "Counter" \this -> pure
   { state: { count: count}
   , render: do
       {count: c} <- React.getState this
       pure $ counterView c do React.setState this {count: c+1}
   }
