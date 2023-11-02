        putStrLn $ "The two lines concatenated turn out to be: " ++ a 

{- Monoidit
  OPERAATTOREIDEIN *,++,[] YHTEISET OMINAISUUDET
- ottavat 2 parametriä
- parametreillä ja palautettavalla arvolla sama tyyppi
- on olemassa arvo, joka ei muuta muita arvoja, kun sitä
- käytetään binäärifunktion kanssa
- assosiatiivisuus: (a+b) + c = a + (b + c)
- 
- MONOIDIN = assosiatiivinen binäärifunktio ja arvo, joka toteuttaa
-            f (x) = x,
-            tulolle x * 1 = x,
-            summalle x + 0 = x,
-            jonolle [x..] ++ [] = [x..]
-- ESIM listalle `mappend` ja `mconcat`
-- [1,2,3] `mappend` [4,5,6] = [1,2,3,4,5,6] 
-- "pang" `mappend` mempty = "pang"
-- mconcat [[1,2],[3,6],[9]] = [1,2,3,6,9] 
--
--  vain konkreettiset datatyypit voivat olla monoideja
--  (toisin kuin function tai applicative)
--}
--
--
--
--
instance Monoid Ordering where  
    mempty = EQ  
    LT `mappend` _ = LT  
    EQ `mappend` y = y  
    GT `mappend` _ = GT 

import Data.Monoid  
    
lengthCompare :: String -> String -> Ordering  
lengthCompare x y = (length x `compare` length y) `mappend`  
                     (vowels x `compare` vowels y) `mappend`  
                     (x `compare` y)  
     where vowels = length . filter (`elem` "aeiou")


