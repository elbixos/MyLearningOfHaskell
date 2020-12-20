import System.Environment
import System.IO
import System.IO.Error
import Control.Exception

import Allu

main = do
    putStrLn "Allumettes"
    let plateau = [1,3,5,7]
    (line , nb) <- get_user_choice
    --putStrLn $ show $ remove_matches plateau (line, nb)
    --putStrLn $ show $ line
    let new_grid = remove_matches plateau (line, nb)
    putStrLn $ show $ new_grid
