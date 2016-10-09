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

**Links**: [Hackage](http://hackage.haskell.org/package/hmatrix) [GitHub](https://github.com/albertoruiz/hmatrix) . [Homepage](http://dis.um.es/~alberto/hmatrix/hmatrix.html)

Contribution
============
* Benchmarks are written using [criterion](http://hackage.haskell.org/package/criterion)
* Please try to write an example code that matches format of the others and presets the same set of functionalities if available
