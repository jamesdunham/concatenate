[![Build Status](https://travis-ci.org/jamesdunham/concatenate.svg?branch=master)](https://travis-ci.org/jamesdunham/concatenate) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/concatenate)](https://cran.r-project.org/package=concatenate)

Functions in concatenate construct human-friendly text from elements whose values aren't known in advance, as in calls to `message`, `warning` or `stop`.

Basics
------

Each function in concatenate returns a comma-separated string. (A length-one character vector.) The workhorse function in concatenate is `cc`.

``` r
cc("one fish", "two fish")
#> [1] "one fish, two fish"
```

Its wrappers `cc_or` and `cc_and` insert "or" and "and" between the last two elements of the input. This is cleaner than wrestling with `paste`.

``` r
cc_and("this", "that", "the other")
#> [1] "this, that and the other"
cc_or("one way", "another")
#> [1] "one way or another"
```

`cn` and its derivatives combine these functions with `sprintf`-like substitution and the grammatical number awareness of `ngettext`.

Two substitions are made ‘sprintf’-style:

-   "‘%c’": the comma-concatenated values of the object, as in ‘cc’
-   "‘%n’": the number of the object

Like `ngettext`, the `cn*` functions return different strings depending on the number of the object.

``` r
x <- unique(iris$Species)
cn_and(x, "a single species: %c", "%n unique species: %c")
#> [1] "3 unique species: setosa, versicolor and virginica"
```

There are row-wise `data.frame` methods for the `cn` functions.

``` r
singular <- "%n row: %c"
plural <- "%n rows whose values are %c"
cn(chickwts[1, ], singular, plural)
#> [1] "1 row: 179, horsebean"
cn_and(chickwts[1:3, 1, drop = FALSE], singular, plural)
#> [1] "3 rows whose values are 179, 160 and 136"
```

The `cc` functions are also available as binary infix operators.

``` r
x <- "important value"
x %c% "!"
#> [1] "important value!"
```

Install
-------

concatenate is available [via CRAN](https://cran.r-project.org/package=concatenate).

    install.packages("concatenate")

Or, get it from GitHub.

    devtools::install_github("jamesdunham/concatenate")
