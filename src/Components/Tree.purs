module Component.Tree where

import Control.Alternative (pure)
import Control.Bind (bind)
import Data.Function (($))
import Data.Unit (Unit)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, mkEffectFn1)
import React (ReactClass, ReactElement)
import React as React

newtype TreeData = TreeData {title::String, children::Array TreeData}

type TreeProps =
  { treeData :: Array TreeData
  , onChange :: EffectFn1 (Array TreeData) Unit
  }

foreign import sortedTreeClass :: ReactClass TreeProps

treeClass :: Array TreeData -> ReactClass {}
treeClass treeData = React.component "Tree" \this -> pure
  { state: { treeData: treeData }
  , render: do
      {treeData: td} <- React.getState this
      pure $ React.createLeafElement sortedTreeClass
        { treeData: td
        , onChange: mkEffectFn1 \newTreeData -> do
          React.setState this { treeData: newTreeData }
        }
  }

treeData :: Array TreeData
treeData =
  [ TreeData { title: "Hello", children: [] }
  , TreeData { title: "World", children: [] }
  ]

tree :: ReactElement
tree = React.createLeafElement (treeClass treeData) {}
