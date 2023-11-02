{- Modules -}
  import Data.List {-avaa Data.Listin globaaliin namespaceen -}

  {- suoraan konsolisa: ghci> :m + Data.List -}
  import Data.List (nub,sort) {- vain sulussa olevat fkt -}
{-  import Data.List (..)  ottaa kaiken -}
  import Data.List hiding (nub) {-import kaikki paitsi nub -}
  import qualified Data.Map as M {-kuten Pythonin import as -}


{-Logical: -and: sekä että, or: jompikumpi tai molemmat,
 - any: mikä tahansa, all: kaikki-
 - intersect:  [1..7] `intersect` [5..10] ==> [5,6,7] -} 
 
