{-
(*) <$> Just 2 <*> Just 8 = Just 16
(++) <$> Just "klingon" <*> Nothing = Nothing
(**2) <$> ( (-) <$> [3,4] <*> [1,2,3])
= [4.0,1.0,0.0,9.0,4.0,1.0]

    ghci> fmap (++"!") (Just "wisdom")  
    Just "wisdom!"  
    ghci> fmap (++"!") Nothing  
    Nothing  


 >>= (bind) takes a monadic value, and a function that 
 takes a normal value and returns a monadic value 
 and manages to apply that function to the monadic 
 value. How does it do that, if the function takes 
 a normal value? Well, to do that, it has to take 
 into account the context of that monadic value. 
-}

applyMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b  
applyMaybe Nothing f  = Nothing  
applyMaybe (Just x) f = f x

{- Just 3 `applyMaybe` \x -> Just (x+1) 
 - Tässä infixiä varten luodaan muuttuja, jonka arvo
 - otetaan edellisestä lausekkeesta (tässä Just 3)-}

class Monad m where  
  return :: a -> m a  
  (>>=) :: m a -> (a -> m b) -> m b  
   
  (>>) :: m a -> m b -> m b  
  x >> y = x >>= \_ -> y  
      
  fail :: String -> m a  
  fail msg = error msg 


-- >> käskysarja-operaattori (aika turha)
-- a >> b sama kuin do { a ; b}
-- putStr "Hello " >> putStrLn "World" 
-- sama kuin
-- do putStr "Hello "
--   putStrLn "World"

(<$>) :: Functor f => (a -> b) -> f a -> f b
fmap :: Functor f => (a -> b) -> f a -> f b
(+1) <$> [1,2,3]
fmap (+1) [1,2,3]
-- area-spell: spell <$> area

(<*>) :: Applicative f => f (a -> b) -> f a -> f b
(+) <$> [1,2] <*> [1,2,3,4] = [2,3,4,5,3,4,5,6]
liftA2 (+) [1,2] [1,2,3,4] = 
-- area-spell with many effects
-- (+) <$> : cast area-spell ; [1,2] effects <*> [1,2,3,4] area
--let f = (+) <$> (*2) <*> (+10)  
--f 3 = 19

Just (+5) <*> (Just 3)= Just 8
liftA2 (*) (Just 5) (Just 3)= Just 15

(>>=) :: Monad m => m a -> (a -> m b) -> m b
Just 1 >>= \a -> if a > 1 then Nothing else Just (1+a)
-- turboahtaaja : syö monadiin wräpätyn valuen
{-
 - ghci> half . stripMonadFromInt $ half . stripMonadFromInt $ half 24
Just 3
ghci> half 24 >>= half >>= half
Just 3 
-}
