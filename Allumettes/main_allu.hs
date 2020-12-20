import System.Environment
import System.IO
import System.IO.Error
import Control.Exception

import Allu

main :: IO ()
main = do
    putStrLn "Allumettes"
    let plateau = [1,3,5,7]
    (l,n) <- get_user_choice
    let line = (read l::Integer)
    let nb = read n::Integer
    putStrLn (show line) 
    --let new_grid = remove_matches plateau (line, nb)
    --putStrLn new_grid
