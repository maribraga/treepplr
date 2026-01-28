# Import data for TreePPL program

`tp_data` takes data and prepares it to be used by
[`tp_treeppl()`](http://treeppl.org/treepplr/reference/tp_treeppl.md).

## Usage

``` r
tp_data(data_input)
```

## Arguments

- data_input:

  One of the following options:

  - The full path of the JSON file that contains the data, OR

  - A string with the name of a model supported by treepplr (see
    [`tp_model_names()`](http://treeppl.org/treepplr/reference/tp_model_names.md)),
    OR

  - A list (or structured list) containing TreePPL data, OR

  - The full path of a multiple sequence alignment in fasta (.fasta,
    .fas) or nexus (.nexus, .nex) format; currently supported for
    `tree_inference` only, (see
    [`tp_model_names()`](http://treeppl.org/treepplr/reference/tp_model_names.md)).

## Value

a list, see
[`tp_check_input()`](http://treeppl.org/treepplr/reference/tp_check_input.md)
for further details.

## Examples

``` r
# \donttest{
# Example using a model name supported by TreePPL
input <- tp_data("tree_inference")
input
#> $data
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13] [,14]
#> [1,]    1    1    0    2    3    0    0    0    0     3     1     1     3     3
#> [2,]    1    1    0    2    0    1    0    0    0     3     1     0     1     1
#> [3,]    0    0    1    1    0    2    1    0    0     0     2     0     3     3
#> [4,]    0    0    1    1    0    3    0    1    0     0     2     2     3     1
#>      [,15]
#> [1,]     2
#> [2,]     0
#> [3,]     0
#> [4,]     0
#> 

# Example using an internal FASTA file (same input data as before, but in fasta format)
fasta_file <- system.file("extdata", "tree_inference.fasta", package = "treepplr")
input <- tp_data(fasta_file)
input
#> $data
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13] [,14]
#> [1,]    1    1    0    2    3    0    0    0    0     3     1     1     3     3
#> [2,]    1    1    0    2    0    1    0    0    0     3     1     0     1     1
#> [3,]    0    0    1    1    0    2    1    0    0     0     2     0     3     3
#> [4,]    0    0    1    1    0    3    0    1    0     0     2     2     3     1
#>      [,15]
#> [1,]     2
#> [2,]     0
#> [3,]     0
#> [4,]     0
#> 
# }
```
