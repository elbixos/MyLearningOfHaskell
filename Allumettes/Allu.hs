module Allu where

import Data.List
import Data.Ord
-- give it the number of matches on a line, and you get a list of possible choices
get_possibles_on_line  a = [1.. min 3 a]

get_possibles_internal_1 xs = map get_possibles_on_line xs

get_possibles_internal_2 xs = zip [0..] (get_possibles_internal_1 xs)

-- give the list of possibilities (ligne, nb_matches) for a given grid
get_possible_choices grid = foldl (++) [] [zip (repeat x) xs | (x,xs) <- get_possibles_internal_2 grid]

-- remove n matches on a grid
remove_matches :: (Integral a) => [a] -> (a , a) -> [a]
remove_matches [] (line, nb) = []
remove_matches (x:xs) (line, nb)
    | line == 0 = (x-nb):remove_matches xs ((line-1), nb)
    | otherwise = x:remove_matches xs ((line-1), nb)

get_next_grids grid = [ remove_matches grid choice | choice <-get_possible_choices grid]
-- give it the grid, and you get a list of possibilities (ligne, nb_matches)

-- evaluate a grid [1,3,2,1]
--    when ia needs to play (1) or when adversary needs to play (-1)
evaluate_grid :: (Integral a) => [a] -> a -> a
evaluate_grid [0,0,0,0] ia = ia
evaluate_grid grid ia = ia * maximum [ia * evaluate_grid new_grid (-1)*ia | new_grid <- get_next_grids grid]

evaluate_grid2 :: (Integral a) => [a] -> a -> a
evaluate_grid2 [0,0,0,0] ia = ia
evaluate_grid2 grid ia
  | ia==1     = maximum [evaluate_grid2 new_grid (-1)*ia | new_grid <- get_next_grids grid]
  | otherwise = minimum [evaluate_grid2 new_grid (-1)*ia | new_grid <- get_next_grids grid]

evaluate_grid_maxdepth :: (Integral a) => [a] -> a -> a -> a
evaluate_grid_maxdepth [0,0,0,0] ia depth = ia
evaluate_grid_maxdepth grid ia 0 = 0
evaluate_grid_maxdepth grid ia depth
  | ia==1     = maximum [evaluate_grid_maxdepth new_grid ((-1)*ia) (depth-1) | new_grid <- get_next_grids grid]
  | otherwise = minimum [evaluate_grid_maxdepth new_grid ((-1)*ia) (depth-1) | new_grid <- get_next_grids grid]

get_best_choice_index grid =
  let
    evals = [evaluate_grid2 new_grid (-1) | new_grid <- get_next_grids grid]
  in snd (maximumBy (comparing fst) (zip evals [0..]))

get_best_choice grid =
  let
    choices = get_possible_choices grid
    best_choice_index = get_best_choice_index grid
  in choices!!best_choice_index


--ia_choice grid =
--  let
--    choices =  get_possible_choices grid

--get_possibles [] = []
--get_possibles (x:others) = zip [1..] get_possibles_on_line(x)
--get_possibles_on_line 0

--get_possibles_on_line 1
--get_possibles_on_line 2
--get_possibles_on_line 3
--get_possibles_on_line 7

get_user_choice :: IO (String,String)
get_user_choice = do
  line <- getLine
  nb <- getLine
  return (line , nb)
