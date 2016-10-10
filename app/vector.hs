import Criterion.Main
import Data.Vector as V

n = 10
main = defaultMain [
         bench "vector creation" $ w (\_ -> fromList sampleList),
         bench "vector indexing" $ w (\_ -> v ! 5),
         bench "vector head/last" $ w (\_ -> V.head v),
         bench "vector last" $ w (\_ -> V.last v),

         bench "vector slicing" $ w (\_ -> slice 1 (n - 1) v),
         bench "vector splitAt" $ w (\_ -> V.splitAt (n `div` 2) v),

         bench "vector prepending" $ w (\_ -> cons (-1) v),
         bench "vector appending" $ w (\_ -> snoc v 11),
         bench "vector concatenation" $ w (\_ -> v V.++ v),

         bench "vector updating" $ w (\_ -> v // [(0, 1), (1, 2), (2, 3), (3, 4), (4, 5)]),
         bench "vector reverse" $ w (\_ -> V.reverse v),

         bench "vector mapping" $ w (\_ -> V.map (+1) v),
         bench "vector zipping" $ w (\_ -> V.zip v v),

         bench "vector searching (elem)" $ w (\_ -> V.elem 11 v),

         bench "vector to list conversion" $ w (\_ -> toList v)
       ]
  where
    w f = f `whnf` 0
    sampleList = [0..n]
    v = fromList sampleList
