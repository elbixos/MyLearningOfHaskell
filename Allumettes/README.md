## The Game of Matches...

A game where you have matches on the table, placed as follow
```
I
III
IIIII
IIIIIII
```

- it's a two players game, turn by turn.
- a player draw between 1 and 3 matches on the line he wants.
- player that draw the last loses.

We want an AI to play, driven by a Min Max algorithm.

a **grid** is the configuration of matches.
A good way to stock it is a list : [1,3,5,7]

a **choice** is what a player does.
A good way to stock this is a tuple of the form (line, nb)

all code is in [main_allu.hs](main_allu.hs) and [Allu.hs](Allu.hs)

## pure functions, simple

- *get_possibles_on_line* : given a number of matches, returns the list of
possible number of matches one can draw

- *get_possible_choices* : given a grid, returns the list of
possible choices, in the form [**choice**]

- *remove_matches* : given a **grid** and a **choice**, returns the new
**grid** after removal

## pure functions, Min Max

Let's implement Min Max.

For that, we need to know if IA is playing or it's adversary.
We'il use the following convention : **ia** is a value of 1 if the AI plays, and
-1 if the adversary plays.

- evaluate_grid : given a **grid** and a value of **ia**,
performs a *min max* algorithm and returns the value of this configuration

- evaluate_grid_maxdepth : same as before but with a max depth limit (returns 0
  if reached)

- get_ia_choice : given a **grid**, returns the **choice** of the AI

## IO functions
