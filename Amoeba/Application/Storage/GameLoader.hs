module Application.Storage.GameLoader where

import GameLogic.Data.Facade
import GameLogic.Language.Translation.Translator

import Application.Game.Engine.Runtime
import qualified Middleware.Tracing.Log as Log
import Middleware.Tracing.ErrorHandling

import Paths_The_Amoeba_World as P
-- TODO: get seed from timer
getSeed = return 100

loadGame worldPath = do
    worldFileRealName <- P.getDataFileName worldPath
    worldContents <- readFile worldFileRealName
    withLogError (return . not . null $ worldContents) $ "No data in data file " ++ worldPath
    case toWorld worldContents of
        Left err -> do
            Log.info $ "Error of loading world: " ++ err
            fail $ "Error of loading world: " ++ err
        Right w -> do
            Log.info $ "World loaded. Items in map: " ++ show (worldMapSize w)
            seed <- getSeed
            return $ mkGame w seed
