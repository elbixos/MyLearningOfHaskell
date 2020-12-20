dir d = if d == 0
    then 0
    else if d<0
        then (-1)
        else 1

dirY 1 = "S"
dirY (-1) = "N"
dirY 0 = ""

dirX 1 = "E"
dirX (-1) = "W"
dirX 0 = ""

        
dirAndNextPos x y lx ly = (dirY (dir (ly-y))++dirX (dir (lx-x)) , x+dir (lx-x) , y+dir (ly-y))
nextDir x y lx ly = dirY (dir (ly-y))++dirX (dir (lx-x))
nextPos x lx = x+dir (lx-x)


testouille x y lx ly = if (nextDir x y lx ly) == ""
    then "youhou"
    else "arf"
loop dirs x y lx ly = if (nextDir x y lx ly) == ""
    then dirs
    else nextDir x y lx ly:loop dirs (nextPos x lx) (nextPos y ly) lx ly 
{--
--}   
