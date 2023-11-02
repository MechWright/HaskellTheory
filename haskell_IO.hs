import System.Exit (exitSuccess)
main = do 
  putStrLn "Kanta?"
  kanta <- getLine
  putStrLn "Korkeus?"
  korkeus <- getLine -- <- paras ystävä IO-monadissa
  {- p.o. <- ettei Haskell ota IO-monadia mukaan
   - let korkeus = getLine VÄÄRIN!! koska 
   - määritelty muuttuja = funktio!
   -}
  putStrLn ("Kolmion pinta-ala on " ++ show (read kanta * read korkeus /2))
  -- p.o. sulut,
  -- ettei Haskell laiskottele ja arvioi alku- ja loppuosaa erikseen!
  --
doGuessing :: (Ord a , Read a) => a -> IO()
-- tyyppiluokat: a:n kuuluttava Ord:iin (koska <) ja Read (koska read)
doGuessing num = do
   putStrLn "Enter your guess:"
   guess <- getLine
   if (read guess) < num
     then do putStrLn "Too low!"
             doGuessing num
     else if (read guess) > num
            then do putStrLn "Too high!"
                    doGuessing num
            else putStrLn "You Win!"

guessNum :: Int -> IO ()
guessNum num = do
   putStrLn "Enter your guess:"
   guess <- getLine
   let answer = numberGuess num (read guess)
   putStrLn answer
   if num /= read guess then
      guessNum num      
   else putStr "You win" 

numberGuess :: Int -> Int -> String
numberGuess a b  
  | a == b = "Correct!"
  | a < b = "Too high!"
  | a > b = "Too low"

