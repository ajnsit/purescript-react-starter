module Main where

import Data.Unit (Unit)
import Effect (Effect)
import MainComponent (mainComponent)
import Render (renderComponent)

main :: Effect Unit
main = renderComponent mainComponent
