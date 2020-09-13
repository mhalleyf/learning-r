Tidyverse examples
================

## GitHub Documents

This is an R Markdown format used for publishing markdown documents to
GitHub. When you click the **Knit** button all R code chunks are run and
a markdown file (.md) suitable for publishing to GitHub is generated.

## Including Code

You can include R code in the document as
follows:

``` r
# Data wrangling using tidyverse (50-80% of the effort of a data science project)
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.3.0 ──

    ## ✓ ggplot2 3.3.2     ✓ purrr   0.3.4
    ## ✓ tibble  3.0.3     ✓ dplyr   1.0.2
    ## ✓ tidyr   1.1.2     ✓ stringr 1.4.0
    ## ✓ readr   1.3.1     ✓ forcats 0.5.0

    ## ── Conflicts ────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(ggplot2)
library(devtools)
```

    ## Loading required package: usethis

## Including Plots

You can also embed plots, for example:

``` r
# Data visualisation
# Basic xy plot with vehicle class mapped as color
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
```

![](tidyverse-review_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

``` r
# Basic xy plot with no mapping
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cyl, y = hwy))
```

![](tidyverse-review_files/figure-gfm/unnamed-chunk-2-2.png)<!-- -->

``` r
# Maps alpha for transparency of points
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
```

    ## Warning: Using alpha for a discrete variable is not advised.

![](tidyverse-review_files/figure-gfm/unnamed-chunk-2-3.png)<!-- -->

``` r
# Maps class of vehicle to shape but be careful, only 6 shapes will plot omitting any other class
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))
```

    ## Warning: The shape palette can deal with a maximum of 6 discrete values because
    ## more than 6 becomes difficult to discriminate; you have 7. Consider
    ## specifying shapes manually if you must have them.

    ## Warning: Removed 62 rows containing missing values (geom_point).

![](tidyverse-review_files/figure-gfm/unnamed-chunk-2-4.png)<!-- -->

``` r
# Makes all points blue
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
```

![](tidyverse-review_files/figure-gfm/unnamed-chunk-2-5.png)<!-- -->

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.
