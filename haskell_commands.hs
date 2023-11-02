{- HASKELL COMMANDS 1 -}

{- start haskell: ghci -}

{- Setting prompt -}

:set prompt "ghci> "

{- Testing for equality-}

5 == 5 True {-equals-}
 5 /= 5  False {-not equals-}
"hello" == "hello" {-string comparison-}

{- Math operatons -}

succ x 
min x y
max x y
{- successor maximum minimum -}


{-Functions -}

doubleMe x = x + x
doubleUs x y = x*2 + y*2 

{- if-else -}
doubleSmallNumber x = if x > 100  
                        then x  
                        else x*2 

{-define-}
let lostNumbers = [4,8,15,16,23,42]

{- List Operations -}
  {-joining: ++ -}
	[1,2,3,4] ++ [9,10,11,12] 
	  {- [1,2,3,4,9,10,11,12]-}
	"hello" ++ " " ++ "world" 
	  {-"hello world"-}
  {-add to front: x: -}
	5:[1,2,3,4,5]
	  {-[5,1,2,3,4,5]-}
	'A':" SMALL CAT"  
	  {-"A SMALL CAT"-}
  {-add to end: :x -}
	let b = [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]] 
	[6,6,6]:b 
	{- [[6,6,6],[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]] -}

	
  {-get Element: !!-}
	[9.4,33.2,96.2,11.2,23.25] !! 1 {-33.2-}
	"Steve Buscemi" !! 6

  {-compare lists: all following True-}
	[3,2,1] > [2,1,0] 
	[3,2,1] > [2,10,100]
	[3,4,2] == [3,4,2] 

  {-head tail init last-}
	head [5,4,3,2,1] {- 5 -}
	tail [5,4,3,2,1] {- [4,3,2,1] -}
	init [5,4,3,2,1] {- [5,4,3,2] -}
	last [5,4,3,2,1] {- 1 -}

  {-others-}
	length {-length-}
	null {-true if empty-}
	reverse [1,2,3,4] {-[4,3,2,1]-}
	take 3 [5,4,3,2,1] {-extracts x from beginnign: [5,4,3]-}
	drop 3 [8,3,2,1,5,6] {-opposite take [1,5,6]-}
	maximum {-biggest-}
	minimum {-smallest-}
	sum {-sum of elements-}
	product {-product of elements-}
	elem 4 'elem' [3,4,5,6] {-checks if list includes: True-}

  {-ranges-}
	[1..20]
	['a'..'z']
	['K'..'W']
	[0.1,0.3 .. 1] {-[0.1,0.3,0.5,0.7,
		0.8999999999999999,1.0999999999999999]
		float ranges are funky!-}
     {-cycle-}	
	take 10 (cycle [1,2,3]) {- [1,2,3,1,2,3,1,2,3,1] -}
     {-repeat-}
	take 10 (repeat 5) {-[5,5,5,5,5,5,5,5,5,5]-}
     {-replicate-}
	replicate 3 10 {-[10,10,10]-}	

  {-list comprehension   -}
    {- ` is shift+' (left from backspace) -}		
	[x*2 | x <- [1..10]] {- S={2*x | x e N, x <=10} {-HUOM nuolen käyttö!-}
				[2,4,6,8,10,12,14,16,18,20] -}
	[x*2 | x <- [1..10], x*2 >= 12] {-[12,14,16,18,20] -}
	[ x | x <- [50..100], x `mod` 7 == 3]  {- luvut 50 ja 100 välillä
		joille x mod 7 = 3: [52,59,66,73,80,87,94]-}    

	let a = [1..20]
	[x*2 | x <- a, x>8, x*2>=12, x*2 `mod` 3 == 0] {-   [18,24,30,36] -}
		
        boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]   
	ghci> boomBangs [7..13]
	  {- 7: (True,<10) ;  8: False, 9: (True, <10), 10: False; ["BOOM!","BOOM!","BANG!","BANG!"] -}
	[ x*y | x <- [2,5,10], y <- [8,10,11]] {-[16,20,22,40,50,55,80,100,110]  -}

    {-list comprehension WITH STRINGS-}
	ghci> let nouns = ["hobo","frog","pope"]  
	ghci> let adjectives = ["lazy","grouchy","scheming"]  
	ghci> [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]  
	{-["lazy hobo","lazy frog","lazy pope","grouchy hobo","grouchy frog",  
	"grouchy pope","scheming hobo","scheming frog","scheming pope"]-}

    {-examples  -}
      {- ` is shift+' (left from backspace) -}

	length' xs = sum [1 | _ <- xs] {- replace all elements in list with 1 and sum up
			- is matlab's ~ -}
        removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]   
	ghci> removeNonUppercase "Hahaha! Ahahaha!" {- "HA" -}		
    	
	let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]  
	[ [ x | x <- xs, even x ] | xs <- xxs]  
	{- [take x from xs if it is even] take xs from xxs - [[2,2,4],[2,4,6,8],[2,4,2,6,2,6]] -}
  	[ [ x | x <- xs, even x ] | xs <- xxs, xs==[1..9]]
 	{- [[2,4,6,8]] -}
	[ [ x | x <- xs, even x ] | xs <- xxs, xs==[1..10]]
        {- [] koska ei löydy vastaavaa listaa -}

  {-Tuples: listoja, joilla fixed pituus, mutta elementtien tyyppi ei tarvitse olla sama-}
	[(1,2),(8,11),(4,5)]
	[("LOTR","Tolkien",1),("GoT","Martin",2),("Eisenhorn","Abnett",3)]
	{-fst snd TOIMII VAIN 2-PITUISILLE TUPLEILLE!-}
	fst (8,11)
	let quiretuplet = ("Wow", False)
	snd quiretuplet {-False-}
	
    {-zip-}
	let authors = ["Tolkien","Martin","Abnett"]
	let novels = ["LotR","GoT","Eisenhorn"]
	zip authors novels {-[("Tolkien","LotR"),("Martin","GoT"),("Abnett","Eisenhorn")]-}

    let rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]  
