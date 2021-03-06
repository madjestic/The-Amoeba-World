module Amoeba.GameLogic.Language.Parsing.ItemParser where

import Amoeba.GameLogic.Language.Parsing.Common
import Amoeba.GameLogic.Language.RawToken

import Amoeba.Middleware.Parsing.Facade as P

item :: GenParser Char st RawToken
item = do
    string "Item" >> many1 trueSpace
    itemName <- stringConstant
    lineEnd
    rs <- resources
    return $ ItemToken itemName rs

resources :: GenParser Char st [PropertyToken]
resources = many resource

resource :: GenParser Char st PropertyToken
resource = do
    identation 4
    name <- identifier
    trueSpaces >> char '=' >> trueSpaces
    val <- resourceValue
    lineEnd
    return $ IntResourceProperty name val

resourceValue :: GenParser Char st (Int, Int)
resourceValue = intTuple2


