module MainComponent where

import React (ReactElement)
import React.DOM as D

mainComponent :: ReactElement
mainComponent = D.h1 [] [D.text "Hello world!"]
