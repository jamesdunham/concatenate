Each of the R functions in `concatenate` takes one or more character vectors and returns a comma-separated string. (A length-one character vector.) They're for not repeating yourself when producing human-friendly messages whose elements aren't known in advance.

`cc_and(...)` is like `paste(x, sep = ",")` but it inserts "and" between the last two elements.

``` r
cc_and("this", "that", "the other")
#> [1] "this, that and the other"
```

`cc_or(...)` works the same way.

``` r
cc_or("one way", "another")
#> [1] "one way or another"
```

`%+%` is for pasting a bit of readable text without typing `paste`.

``` r
x <- "important value"
x %+% "!"
#> [1] "important value!"
```
