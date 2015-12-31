-- TreeMap.hs

data Tree a = Node (Tree a) (Tree a)
          | Leaf a
            deriving (Show)

treeLengths :: Tree String -> Tree Int
treeLengths (Leaf s) = Leaf $ length s
treeLengths (Node l r) = Node (treeLengths l) (treeLengths r)

treeMap :: (a -> b) -> Tree a -> Tree b
treeMap f (Leaf s) = Leaf $ f s
treeMap f (Node l r) = Node (treeMap f l) (treeMap f r)

instance Functor Tree where
    fmap = treeMap
