# Import data for TreePPL program

Prepare data input for
[`tp_run()`](http://treeppl.org/treepplr/reference/tp_run.md).

## Usage

``` r
tp_data(data_input)
```

## Arguments

- data_input:

  One of the following options:

  - A list (or structured list) containing TreePPL data, OR

  - The full path of a multiple sequence alignment in fasta (.fasta,
    .fas) or nexus (.nexus, .nex) format, OR

  - For test data, a string with the name of a model supported by
    treepplr (see
    [`tp_model_library()`](http://treeppl.org/treepplr/reference/tp_model_library.md)).

- dir:

  The directory where you want to save the data file in JSON format.
  Default is [`base::tempdir()`](https://rdrr.io/r/base/tempfile.html).

## Value

The path for the data file that will be used by
[`tp_run()`](http://treeppl.org/treepplr/reference/tp_run.md).

## Examples

``` r
# \donttest{
# Example using a model name supported by TreePPL
input <- tp_data("tree_inference")
#> Warning: running command 'find /tmp/NA -name testdata_tree_inference.json' had status 1
#> Error in tp_data("tree_inference"): Invalid input string.
input
#> Error: object 'input' not found

# Example using an internal FASTA file (same input data as before, but in fasta format)
fasta_file <- system.file("extdata", "tree_inference.fasta", package = "treepplr")
input <- tp_data(fasta_file)
#> Error in cat(data, file = path): argument 1 (type 'closure') cannot be handled by 'cat'
input
#> Error: object 'input' not found
# }
```
