import Data.Char

-- GUARDS
--
-- 2ND ORDER POLYNOMIAL FORMULA ax^2+bx+c
numOfRealSolutions :: (Ord a1, Num a2, Num a1) => a1 -> a1 -> a1 -> a2
numOfRealSolutions a b c
    | disc > 0  = 2
    | disc == 0 = 1
    | otherwise = 0
        where
        disc = b^2 - 4*a*c
capitalize :: String -> String
capitalize x =
  let capWord []     = []
      capWord (x:xs) = toUpper x : xs
      -- this means (toUpper x ) : xs, ie. capitalize the first letter
      -- and keep the rest as is
  in unwords (map capWord (words x))

capitalize2 :: String -> String
capitalize2 x = unwords (map capWord (words x))
    where
      capWord [] = []
      capWord (x:xs) = toUpper x : xs

capitalize3 :: String -> String
capitalize3 = unwords <$> capWord <*> words 
    where
         capWord [] = []
         capWord (x:xs) = toUpper x : xs

