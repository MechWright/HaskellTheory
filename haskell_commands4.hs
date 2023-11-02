{- Higher order fkt -}
{- monta parametria = yksi parametri kerrallaan
esim. zipWith' (+) [1,2,3,4] [5,6,7,8]
 - -}

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]  
zipWith' _ [] _ = []  
zipWith' _ _ [] = []  
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys 

{- sulut pakolliset: ensimmäinen parametri on funktio,
 - joka palauttaa funktion, joka palauttaa tuloksen, eli
 - ikäänkuin palauttaa 2 asiaa -}

applyTwice :: (a -> a) -> a -> a  
applyTwice f x = f (f x)  

multThree :: (Num a) => a -> (a -> (a -> a))  
multThree x y z = x * y * z  


-- LOCAL DEFINITIONS -- 
flip' :: (a -> b -> c) -> (b -> a -> c)  
flip' f = g  
   where g x y = f y x  

largestDivisible :: (Integral a) => a  
largestDivisible = head (filter p [100000,99999..])  
   where p x = x `mod` 3829 == 0  

heron :: Floating a => a -> a -> a -> a
heron a b c = sqrt (s * (s - a) * (s - b) * (s - c))
    where s = (a + b + c) / 2

-- even this is allowed
areaTriangleHeron a b c = result           -- use Heron's formula
    where
    result = sqrt (s * (s - a) * (s - b) * (s - c))
    s      = (a + b + c) / 2




{-sum (takeWhile (<10000) (filter odd (map (^2) [1..])))-}
{-sum (takeWhile (<10000) [n^2 | n <- [1..], odd (n^2)])-}

chain :: (Integral a) => a -> [a]  
chain 1 = [1]  
chain n  
    | even n =  n:chain (n `div` 2)  
    | odd n  =  n:chain (n*3 + 1)   

numLongChains :: Int
numLongChains = length (filter isLong (map chain [1..100]))
        where isLong xs = length xs > 15
{- anonyymillä funktioita: -}
numLongChains2 :: Int
numLongChains2 = length (filter (\xs -> length xs > 15) (map chain [1..100])) 

{-zipWith (\a b -> (a * 30 + 3) / b) [5,4,3,2,1] [1,2,3,4,5] -}

flip2' :: (a -> b -> c) -> b -> a -> c  
flip2' f = \x y -> f y x 


{-folds and horses-}

{-sum' :: (Num a) => [a] -> a  
sum' xs = foldl (\acc x -> acc + x) 0 xs-}

sum' :: (Num a) => [a] -> a
sum' = foldl (+) 0


sumr' :: (Num a) => [a] -> a
sumr' = foldr (+) 0


map' :: (a -> b) -> [a] -> [b]  
map' f xs = foldr (\x acc -> f x : acc) [] xs   

{-mapl' :: (a -> b) -> [a] -> [b]
mapl' f xs = foldl (\x acc -> f x : acc) [] xs-}

maximum' :: (Ord a) => [a] -> a  
maximum' = foldr1 (\x acc -> if x > acc then x else acc)  
  
reverse' :: [a] -> [a]  
reverse' = foldl (\acc x -> x : acc) []  
  
product' :: (Num a) => [a] -> a  
product' = foldr1 (*)  
  
filter' :: (a -> Bool) -> [a] -> [a]  
filter' p = foldr (\x acc -> if p x then x : acc else acc) []  
  
head' :: [a] -> a  
head' = foldr1 (\x _ -> x)  
  
last' :: [a] -> a  
last' = foldl1 (\_ x -> x)

{- $-funktio: lowest precedence (obv retardi funktio) -}
{-sqrt $ 3 + 4 + 9 sama kuin sqrt (3 + 4 + 9)-}

{- function composition -}

(.) :: (b -> c) -> (a -> b) -> a -> c  
f . g = \x -> f (g x)
{-
map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24]
map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]  
replicate 100 (product (map (*3) (zipWith max [1,2,3,4,5] [4,5,6,7,8])))


map (negate . abs) [5,-3,-6,7,-3,2,-19,24] 
map (negate . sum . tail) [[1..5],[3..6],[1..7]] 
replicate 100 (product (map (*3) (zipWith max [1,2,3,4,5] [4,5,6,7,8])))
-----
oddSquareSum :: Integer  
oddSquareSum = sum (takeWhile (<10000) (filter odd (map (^2) [1..]))) 

oddSquareSum :: Integer  
oddSquareSum = sum . takeWhile (<10000) . filter odd . map (^2) $ [1..]  
-}
{-
oddSquareSum :: Integer  
oddSquareSum =   
    let oddSquares = filter odd $ map (^2) [1..]  
    belowLimit = takeWhile (<10000) oddSquares  
    in  sum belowLimit  
    -}
