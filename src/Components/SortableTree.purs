module SortableTree where

import Control.Alternative (pure)
import Control.Bind (bind)
import Data.Function (($))
import Effect.Uncurried (mkEffectFn1)
import React (ReactClass, ReactElement)
import React as React
import React.DOM as D
import React.DOM.Props as P

newtype TreeData = TreeData
  { title :: String
  , children :: Array TreeData
  }

type TreeProps =
  { treeData :: Array TreeData
  , onChange :: React.SyntheticEventHandler (Array TreeData)
  }

foreign import sortableTreeClass :: ReactClass TreeProps

treeClass :: ReactClass { treeData :: Array TreeData }
treeClass = React.component "Tree" \this -> do
  props <- React.getProps this
  pure
    { state: {treeData: props.treeData }
    , render: do
        state <- React.getState this
        pure $ React.createLeafElement sortableTreeClass
          { treeData: state.treeData
          , onChange: mkEffectFn1 \newData -> do
              React.setState this { treeData: newData }
          }
    }

tree :: ReactElement
tree = D.div [P.style {height: "400px"}]
  [ React.createLeafElement treeClass
      { treeData: [TreeData {title: "Hellow", children: []}, TreeData {title: "World", children: []}]
      }
  ]
