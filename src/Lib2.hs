{-# OPTIONS_GHC -Wno-unused-top-binds #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Lib2(State, renderDocument, hint, gameStart) where

import Types ( ToDocument(..), Document(..), Check(..), Coord(..) )
import Lib1 (State(..))

-- IMPLEMENT
-- First, make Check an instance of ToDocument class

instance ToDocument Check where
  toDocument (Check c) = DMap [("coords", DList $ [d | d <- toDocument c])]
  
-- IMPLEMENT
-- Renders document to yaml
renderDocument :: Document -> String
renderDocument _ = error "Implement me"

-- IMPLEMENT
-- This adds game data to initial state
-- Errors are reported via Either but not error 
gameStart :: State -> Document -> Either String State
gameStart (State l) d = Right $ State $ ("Game started: " ++ show d) : l

-- IMPLEMENT
-- Adds hint data to the game state
-- Errors are reported via Either but not error 
hint :: State -> Document -> Either String State
hint (State l) h = Right $ State $ ("Hint " ++ show h) : l
