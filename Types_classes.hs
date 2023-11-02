addThree :: Int -> Int -> Int -> Int  
addThree x y z = x + y + z 

{- Later on we'll see why they're all just separated with -> instead of having some more explicit distinction between the return types and the parameters like Int, Int, Int -> Int or something. -}

factorial :: Integer -> Integer  
factorial n = product [1..n]  
{- Int is 32bit, Integer is unlimited -}


circumference :: Float -> Float  
circumference r = 2 * pi * r  
{- Floating point with singles precision -}

circumference' :: Double -> Double  
circumference' r = 2 * pi * r  
{- Floating point with double precision -}


data Vector a = Vector a a a deriving (Show)

vplus :: (Num t) => Vector t -> Vector t -> Vector t
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)

vectorMult :: (Num t) => Vector t -> t -> Vector t
(Vector i j k) `vectorMult` b = Vector (i*b) (j*b) (k*b)


dotProduct :: (Num t) => Vector t -> Vector t -> t
(Vector i j k) `dotProduct` (Vector u v w) = i*u + j*v + k*w

{- Maybe is a type constructor!
 - Maybe String is a concrete type!
 - Maybe käytetään yleensä tuloksena, joka voi
 - olla fail, mutta tulos "nothing" ei kerro, mikä
 - meni pieleen! -}

data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show)  
{- eitheriä voi käyttää laskun tuloksena: joko virheilmoitus tai 
 - onnistunut tulos -}

{- TYYPIT JA TYYPPILUOKAT}
Tyypit (->): Int, Integer, Double, Float, Char, String 
TyyppiLuokat (=>): Num, Floating, Fractional, Foldable, fromIntegral-}

class Eq' a
  where
    (==), (/=) :: a -> a -> Bool

    x /= y = not (x == y)
    x == y = not (x /= y)

data Foo = Foo { x :: Integer, str :: String}
  deriving (Eq, Ord, Show) -- käyttää valmiita Preluden metodeja
{-
instance Eq Foo where
    ... instance Eq on lupaus, että instanssista löytyy implementointi
    tyyppiluokan metodeille (tässä tapauksessa /= ja ==, molemmat a -> a -> Bool)
    -}
-- LUOKAT OVAT TYYPPIKATEGORIOITA , INSTANSSIT OVAT TYYPPEJÄ
{--
Eq
    Equality operators == and /=

Ord
    Comparison operators < <= > >=; min, max, and compare.

Enum
    For enumerations only. Allows the use of list syntax such as [Blue .. Green].

Bounded
    Also for enumerations, but can also be used on types that have only one constructor. Provides minBound and maxBound as the lowest and highest values that the type can take.

Show
    Defines the function show, which converts a value into a string, and other related functions.

Read
    Defines the function read, which parses a string into a value of the type, and other related functions.-}

{-
-- TYPE FAMILY lupaa, että kaikilla membereillä on sama muoto, tässä
-- 3 muuttujaa, esim. j= "organisation" t = Request '[JSON]' p = NoContent
-- ensim. Symbol-tyyppinen, muut Type; 
type family AccountPath (j :: Symbol) (t :: Type) (p :: Type) :: Type where
  AccountPath j t p =
    AuthProtect "Optional'"
      :> j
      :> t
      :> Post '[JSON] p

-- Type on vain synonyymi - tässä se on lyhennysmerkintä: lisää alkuosan 
-- (AuthProtect required :> "invitation" :> a

type InvitationPath' a =
  AuthProtect "Required"
    :> "invitation"
    :> a

data InvitationRoutes a = InvitationRoutes
  { createInvitation'
      :: a
        :- InvitationPath' (ReqBody '[JSON] InvitationRequest :> Post '[JSON] NoContent)
 -}
