import Criterion.Main
import Numeric.LinearAlgebra

n = 10 :: Int
main = defaultMain [
         bench "matrix creation" $ w (\_ -> fromLists sampleList :: Matrix Double),
         bench "random matrix generation" $ whnfIO (randn n n),
         bench "matrix multiplication" $ w (\_ -> sampleDiag <> sampleDiag),
         bench "matrix slicing" $ whnf (\n -> sampleDiag ?? (Take (n - 1), Take (n - 1))) n,

         bench "scalar multiplication" $ whnf (\n -> sampleDiag * (fromIntegral n)) n,

         bench "matrix-vector addition" $ w (\_ -> sampleDiag + sampleDiag),

         bench "transpose" $ w (\_ -> tr sampleDiag)
       ]
  where
    w f = f `whnf` 0
    sampleList = replicate n $ replicate n 1
    sampleDiag = diagl [1..fromIntegral n]
