-- a pure function that do stuff with constrained types
my_pure_f :: (Integral a) => a -> a -> a
my_pure_f x y = x+y

main = do
  x <- getLine
  y <- getLine
  putStrLn $ show $ my_pure_f (read x::Integer) (read y::Integer)
