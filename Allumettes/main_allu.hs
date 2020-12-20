import System.Environment
import System.IO
import System.IO.Error
import Control.Exception

import Allu

main = do
    putStrLn "Allumettes"
    let grid = [1,3,5,0]
    let player=1

    winner:_ <- game_loop grid player
    putStrLn $ "Vainqueur : "++ show winner
