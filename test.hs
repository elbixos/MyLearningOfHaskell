-- une histoire de liste ...

lostNumbers = [4,8,15,16,23,42]
lostNumbers2 = [1,2,3,4] ++ [9,10,11,12]
unStr = "hello" ++ " " ++ "world"
deuxStr =  'A':" SMALL CAT"
eltAccess = lostNumbers !! 2

b = [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]
b2 =b ++ [[1,1,1,1]]
b3= [6,6,6]:b

-- type des listes
-- forb = [4,'a']

-- les listes sont comparables 
t1 = [3,2,1] > [2,1,0]
-- et c'est le même ordre (lexicographique) que les str ...
t2 = "ABC" < "AC"

-- op courantes sur listes
op1 = head [5,4,3,2,1]
op2 = tail [5,4,3,2,1]
op3 = init [5,4,3,2,1]
op4 = last [5,4,3,2,1]

-- forb = head []

op5 = length [5,4,3,2,1]
op6 = null [5,4,3,2,1]
op7 = reverse [5,4,3,2,1]
op8 = take 3 [5,4,3,2,1]
op9 = drop 3 [5,4,3,2,1]
opa = minimum  [5,4,3,2,1]
opb = maximum [5,4,3,2,1]
opc = sum [5,2,1,6,3,2,5,7]
opd = product [5,2,1,6,3,2,5,7]
ope = elem 4 [5,2,1,6,3,2,5,7]

-- range / progression
l1 = [1..20]
l2 = ['K'..'Z']
l3 = [3,6..20]
l4 = [20,19 .. 0]
l5 = [0.1, 0.3 .. 1] -- attention

-- liste infinie
l6= take 24 [0,1..]
l7 = take 24 [13, 26..]
l8 = [1,2 ..]

l9 = take 10 (cycle [1,2,3])
la = take 10 (repeat 5)

-- comprehension
lb = [x*2 | x <- [1..10]]
lc = [ x | x <- [10..20], x /= 13, x /= 15, x /= 19]
ld = [x**2 | x <- [1..10]]

-- more comprehension 
length' xs = sum [1 | _ <- xs]

le = [ x*y | x <- [2,5,10], y <- [8,10,11], x*y >50]

xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]
xxss =  [ [ x | x <- xs, even x ] | xs <- xxs] -- VP

-- tuples
tt1 = fst ("Wow", False)
tt2 = snd ("Wow", False)

-- forb = [(1,2,3),(4,5)]
-- forb = [(1,2,3),(4,5,'A')]

tt3 = zip [1,2,3,4,5] [5,5,5,5,5]
tt4 = zip [1..] ["apple", "orange", "cherry", "mango"]

rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]
-- rightTriangles2 = [ (a,b,c) | c <- [1..], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c > 24, a+b+c <30]

-- Typages 
e1 = 4 + 5
-- e2 = 4 + 'A'

doubleMe x = x + x

doubleMe' ::  Int -> Int
doubleMe' x = x * 2

doubleUs x y = x*2 + y*2
-- doubleUs 4 9
-- doubleUs 4.5 9
-- doubleUs 4.5 9::Int
-- :t doubleUs 
-- doubleUs x y = x*2 + y*2
doubleSmallNumber x = (if x > 100 then x else x*2) + 1

conanO'Brien = "It's a-me, Conan O'Brien!"

removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

--removeNonUppercase conanO'Brien 
-- :t removeNonUppercase

-- Type again
-- Int Char [Char] 
-- Int Integer
factorial :: Int -> Int
factorial n = product [1..n]
-- factorial 50
factorial2:: Integer -> Integer
factorial2 n = product [1..n]
factorial3 n = product [1..n]

-- Float / Double
circumference :: Float -> Float
circumference r = 2 * pi * r

-- circumference 4.0

circumference' :: Double -> Double
circumference' r = 2 * pi * r


-- circumference' 4.0

-- Variable de type 
-- :t head
-- :t fst

-- Classe de types
-- :t (==)
-- :t elem

-- Eq / Ord 
-- Show / Read
-- read "True" || False
-- read "8.2" + 3.8
-- read "[1,2,3,4]" ++ [3]
-- read "4"
-- :t read
--  read "5" :: Int

-- Enum
-- :t succ

-- Bounded
-- :t minBound
-- minBound :: Int

-- maxBound :: (Bool, Int, Char)

-- Num / Integral / Floating

-- :t fromIntegral

-- filtrage par motifs
lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"

sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"

factorial' :: (Integral a) => a -> a
factorial' 0 = 1
factorial' n = n * factorial' (n - 1)

charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)


first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

-- let xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]
-- [a+b | (a,b) <- xs]

head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x

length'' :: (Num b) => [a] -> b
length'' [] = 0
length'' (_:xs) = 1 + length'' xs

capital :: String -> String
capital "" = "Empty string, whoops!"
capital toto@(x:xs) = "The first letter of " ++ toto ++ " is " ++ [x]

-- Gardes

max' :: (Ord a,Num a) => a -> a -> a
max' a b
    | a > b     = a + b
    | otherwise = b

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b     = GT
    | a == b    = EQ
    | otherwise = LT

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname


-- let 

cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^2
    in  sideArea + 2 * topArea

-- 4 * (let a = 9 in a + 1) + 2

-- [let square x = x * x in (square 5, square 3, square 2)]
-- (let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)
--  (let (a,b,c) = (1,2,3) in a+b+c) * 100

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort [a | a <- xs, a <= x]
        biggerSorted = quicksort [a | a <- xs, a > x]
    in  smallerSorted ++ [x] ++ biggerSorted

-- quicksort [10,2,5,3,1,6,7,4,2,3,4,8,9]


-- curryfication
-- max 4
-- :t max 4
-- 

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

-- applyTwice (+3) 10

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g x y = f y x

flip'' :: (a -> b -> c) -> b -> a -> c
flip'' f y x = f x y