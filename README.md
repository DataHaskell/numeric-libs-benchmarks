numeric-libs-overview
=====================

An overview of different Haskell numeric libraries. This is intended to be a place to compare different numeric libraries
by their ease of use, performance and more.

_Pull requests are welcome if you want to add a library!_

These overviews include:
* Benchmarks
* Example code
* Links to hackage, github and the homepage if available

Libraries
=========

vector
------
An efficient implementation of Int-indexed arrays (both mutable and immutable), with a powerful loop optimisation framework.

**Example code**:
```haskell
let x = fromList [0..5]

length x -- 6
null x -- False

-- Indexing
x ! 1 -- 1
head x -- 0
last x -- 5

-- Slicing
slice 2 3 x -- [2, 3, 4]
splitAt 2 x -- ([0, 1], [2, 3, 4, 5])

-- Prepending and Appending
cons (-1) x -- [-1, 0, 1, 2, 3, 4, 5]
snoc x 6 -- [0, 1, 2, 3, 4, 5, 6]

-- Concatenation
x ++ x -- [0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5]
concat [x, x] -- [0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5]

-- Update
x // [(0, 1), (2, 6)] -- [1, 1, 6, 3, 4, 5]

map (+2) x -- [2, 3, 4, 5, 6, 7]
```

[**Benchmarks**](http://mdibaiee.github.io/numeric-libs-overview/benchmarks/vector.html)

**Links**: [Hackage](http://hackage.haskell.org/package/vector) . [GitHub](https://github.com/haskell/vector)

hmatrix
-------
hmatrix is a linear algebra library and matrix computations.

**Example code**:
```haskell

-- Creating matrices
let x = (2><2) [0..3] :: Matrix Double

x -- [ 0.0, 1.0
  -- , 2.0, 3.0 ]

let y = fromLists [[0, 1], [2, 3]] :: Matrix Double

-- Random matrices

r <- randn 2 3
r -- [ 0.7764496757867578,    1.246311658930589,    -0.684233085372455
  -- , -2.540045307941425, -0.20975584071908912, -9.039537343065803e-3 ]

-- Matrix multiplication

x <> y -- [ 2.0,  3.0 
       -- , 6.0, 11.0 ]

-- Transpose

tr x -- [ 0.0, 2.0 
     -- , 1.0, 3.0 ]

-- Matrix slicing
r ?? (All, Take 2) -- [ 0.7764496757867578,    1.246311658930589
                   -- , -2.540045307941425, -0.20975584071908912 ]

-- SVD

(u, s, v) = svd r

-- Mapping over matrices

cmap ((+ 2) . (*2)) x -- [ 2.0, 4.0
                      -- , 6.0, 8.0 ]

-- Flatten

flatten x -- [0.0, 1.0, 2.0, 3.0]
```

[**Benchmarks**](http://mdibaiee.github.io/numeric-libs-overview/benchmarks/hmatrix.html)

**Notes**:
* Uses the [vector](#vector) library under the hood (specifically, [`Data.Vector.Storable`](http://hackage.haskell.org/package/vector-0.11.0.0/docs/Data-Vector-Storable.html))

**Links**: [Hackage](http://hackage.haskell.org/package/hmatrix) . [GitHub](https://github.com/albertoruiz/hmatrix) . [Homepage](http://dis.um.es/~alberto/hmatrix/hmatrix.html)

Contribution
============
* Benchmarks are written using [criterion](http://hackage.haskell.org/package/criterion)
* Please try to write an example code that matches format of the others and presets the same set of functionalities if available
