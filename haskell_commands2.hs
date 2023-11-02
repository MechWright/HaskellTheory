	  {- Types and Typeclasses-}

{-Static type system-}
  {- :t getType -}
  :t 'a' {- 'a' :: Char-}	
  :t "HELLO!" {-"HELLO!" :: [Char]-}
  :t (True, 'a') {-(True, 'a') :: (Bool, Char)-}
  
  let rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]
  :t rightTriangles {-rightTriangles :: (Num c, Eq c, Enum c) => [(c, c, c)]-}

{-Defining function input/output types-}
   removeNonUppercase :: [Char] -> [Char]  
   removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']] 
   {- Eats Char -> output Char;
 - Reading from right to left:
 - c is an element in [A..Z], input st is fed to c, pipes out if part of c (capital) -}

{-Type variables-}
	:t head  {-head :: [a] -> a 
		Head is a Type variable (like generics)-}
	:t fst {- fst :: (a, b) -> a
		Eats a tuple of two and returns the first one-}
	:t (==) {-(==) :: (Eq a) => a -> a -> Bool -
		Tässä => on 'class constraint': vaatii, että input-arvot 
		ovat samaa tyyppiä!-}
	:t elem {-(Eq a) => a -> [a] -> Bool 
		okska käyttää == -operaattoria -}
	:t (>) {-(>) :: (Ord a) => a -> a -> Bool
		Ord covers >, <, >=, <= -}
	"Abrakadabra" `compare` "Zebra"  {-LT-}
	5 `compare` 3 {-GT-}
		{-Ordering is a type GT,LT or EQ -}
   {-show: present as string, read: convert String to what it looks like -}
	show 3 {-3-}
	read "8.2" + 3.8 {-12-}
	read "8.2" {-error koska readin tyyppi ei oo etukäteen tiedossa-}
	read "8.2" :: Float {-ok-}
	read "True" || False {-True-} 
   
   {-Enum: tyypit, jotka voi järjestää:-}
 	['a'..'e']
	[3 .. 5]
	succ 'B' 
   {-Bounded: ala-ja yläraja-}
	minBound :: Int  {--2147483648-}
	maxBound :: Char {-'\1114111'-}
	maxBound :: (Bool, Int, Char) {-(True,2147483647,'\1114111') 
		if members are Bounded, so is Tuplet which consists of them-}

   {-Num: numerot tai numeroiksi kelpaavat (kinda typecast)-}
	20 :: Int
	20 :: Float
	:t (*)  
	{- 20, 20.0,
 	 (*) :: (Num a) => a -> a -> a Tulo ottaa 2 SAMAN TYYPIN NUMia ja palauttaa niiden tulon
	(5 :: Int) * (6 :: Integer) ERROR, muuta
	5 * (6 :: Integer) koska 5 voidaan typecastata INT:ksi -}

   {-Integral: kokonaisluvut, 
 - Floating: liukuluvut, 
 - fromIntegral :: (Num b, Integral a) => a -> b muuttaa Kokonaisluvun geneeriksesi Num -}
   	let s = [1,2,3,4,5]
	length s + 3.4 {-ERROR koska length :: [a] -> Int palauttaa Integerin eikä geneeristä Num-}
	fromIntegral( length s) + 3.4 {- toimii -}
