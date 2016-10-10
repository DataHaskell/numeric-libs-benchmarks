import Criterion.Main
import Numeric.LinearAlgebra

n = 10 :: Int
main = defaultMain [
         bench "eigenvalues" $ w (\_ -> eigenvalues sampleDiag),
         bench "singularValues" $ w (\_ -> singularValues sampleDiag),

         bench "svd" $ w (\_ -> svd sampleDiag),
         bench "thin svd" $ w (\_ -> thinSVD sampleDiag),

         bench "nullspace" $ w (\_ -> nullspace sampleDiag),
         bench "orthogonal" $ w (\_ -> orth sampleDiag),

         bench "determinant" $ w (\_ -> det sampleDiag)
       ]
  where
    w f = f `whnf` 0
    sampleList = replicate n $ replicate n 1
    sampleDiag = diagl [1..fromIntegral n]
