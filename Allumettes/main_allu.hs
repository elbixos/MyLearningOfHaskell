import System.Environment
import System.IO
import System.IO.Error
import Control.Exception

import Allu

main = do
    putStrLn "Allumettes"
    let grid = [1,3,5,7]
    let player=1
    --(line , nb) <- get_user_choice
    --let new_grid = remove_matches plateau (line, nb)
    --putStrLn $ show $ new_grid
    winner:_ <- game_loop grid player
    putStrLn $ "Vainqueur : "++ show winner
