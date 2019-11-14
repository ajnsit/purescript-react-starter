module MainComponent where

import Control.Alternative (pure)
import Control.Bind (bind)
import Data.CommutativeRing ((+))
import Data.Function (($))
import Data.Semigroup ((<>))
import Data.Show (show)
import React (ReactClass, ReactElement)
import React as React
import React.DOM as D
import React.DOM.Props as P
import SortableTree (tree)

mainComponent :: ReactElement
mainComponent = D.div []
  [ D.h1 [P.style {color: "#555"}] [D.text "Hello Purescript!"]
  , counter
  , tree
  ]

counter :: ReactElement
counter = React.createLeafElement counterComponent { count: 100 }

counterComponent :: ReactClass { count :: Int }
counterComponent = React.component "Counter" \this -> do
  props <- React.getProps this
  pure $ { state: { count: props.count }
         , render: do
             state <- React.getState this
             pure $ D.div'
               [ D.div' [D.text ("Current count: " <> show state.count)]
               , D.div' [D.button [P.onClick (clickHandler this)] [D.text "Increment"]]
               ]
         }
  where
    clickHandler this evt = do
      state <- React.getState this
      React.setState this { count: state.count + 1 }
