f x = x + 3
square x = x ^ 2

{- EKVIVALENTTIMUODOT
squareOfF x = square (f x)
fOfSquare x = f (square x)

squareOfF x = (square . f) x
fOfSquare x = (f . square) x

squareOfF = square . f
-- Applied from RIGHT to LEFT 
-}
