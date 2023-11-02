{-toEmail e =
  let l = encodeUtf8 <$> split (=='@') e
   in unsafeEmailAddress (head l) (last l)-}

Tuossa Value määrittelyssä oli vinkkinä deriving (Functor) 
eli sen tyyppiluokan funktiot toimii automaagisesti.


decodeMessage :: Message -> Either Message String
decodeMessage msg@(Message {msgBody}) =
case B64.decode msgBody of
  Right msgBody' -> Right $ msg { msgBody = msgBody' }
  Left e -> Left e
