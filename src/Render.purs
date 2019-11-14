module Render where

import Control.Alternative (pure)
import Control.Bind (bind)
import Data.Functor (void)
import Data.Maybe (Maybe(..))
import Data.Unit (Unit, unit)
import Effect (Effect)
import React (ReactElement)
import ReactDOM as ReactDOM
import Web.DOM.NonElementParentNode (getElementById) as DOM
import Web.HTML (window) as DOM
import Web.HTML.HTMLDocument (toNonElementParentNode) as DOM
import Web.HTML.Window (document) as DOM

renderComponent :: ReactElement -> Effect Unit
renderComponent component = do
  win <- DOM.window
  doc <- DOM.document win
  let node = DOM.toNonElementParentNode doc
  mroot <- DOM.getElementById "main" node
  case mroot of
    Nothing -> pure unit
    Just root -> void (ReactDOM.render component root)
