#' Provide normalized names and make return an tmp_dir.
#'
#' @description
#' `tp_tempdir` provides a temporary directory where the executables can
#' read and write temporaty files. Its path is returned in normalized format
#' \bold{with} system-dependent terminal separator.
#'
#' @param temp_dir NULL, or a path to be used; if NULL, R's [base::tempdir()]
#' is used.
#' @param sep Better ignored; non-default values are passed to
#' [base::normalizePath()].
#' @param sub Extension for defining a sub-directory within the directory
#' defined by [base::tempdir].
#'
#' @return Normalized path with system-dependent terminal separator.
#' @export

tp_tempdir <- function(temp_dir = NULL,
                       sep = NULL,
                       sub = NULL) {
  if (is.null(sep)) {
    sep <- sep()
    if (is.null(temp_dir))
      temp_dir <- tempdir()
    temp_dir <- normalizePath(temp_dir, sep)
    if (substring(temp_dir, nchar(temp_dir)) != sep) {
      temp_dir <- paste0(temp_dir, sep)
    }
    if (!is.null(sub))
      temp_dir <- paste0(temp_dir, sub, sep)
    if (!dir.exists(temp_dir))
      dir.create(temp_dir)
    temp_dir
  }
}

#Provide a separator character platform dependent
sep <- function() {
  if (.Platform$OS.type == "windows")
    "\\"
  else
    "/"
}

#Find model and data describe in model_name
find_file <- function(model_name, exten) {
  if (exten == "tppl") {
    readr::read_file(paste0(
      system.file("extdata", package = "treepplr"),
      sep(),
      model_name,
      ".",
      exten
    ))
  } else if (exten == "json") {
    jsonlite::fromJSON(paste0(
      system.file("extdata", package = "treepplr"),
      sep(),
      model_name,
      ".",
      exten
    ))
  }
}

#' Provide model filenames stored by user in [base::tempdir()]) using
#' [treepplr::tp_write()])
#'
#' @description Provide a list of all the model filenames currently
#' stored in [base::tempdir()]). They can also be use to verify if data are
#' attach to these models (see [treepplr::tp_data_stored()])
#'
#' @return A list of model filenames.
#' @export

tp_model_stored <- function() {
  model_data_stored("tppl")
}

#' Provide data filenames stored by user in [base::tempdir()]) using
#' [treepplr::tp_write()])
#'
#' @description Provide a list of all the data filenames currently
#' stored in [base::tempdir()]). They can also be use to verify if model are
#' attach to these data (see [treepplr::tp_model_stored()])
#'
#' @return A list of data filenames.
#' @export

tp_data_stored <- function() {
  res <- model_data_stored("json")
  list_na <- stringr::str_extract(res, "^((?!_out).)*$")
  list <- list_na[!is.na(list_na)]
  list
}

#' Provide model filenames compiled by user in [base::tempdir()]) using
#' [treepplr::tp_write()])
#'
#' @description Provide a list of all the compiled model filenames currently
#' stored in [base::tempdir()]).
#'
#' @return A list of compiled model filenames.
#' @export

tp_compile_stored <- function() {
  model_data_stored("exe")
}

#Provide file names already provide by user stored in [base::tempdir()])
model_data_stored <- function(exten) {
  tmp <- list.files(tp_tempdir())
  list_na <-
    stringr::str_extract(tmp, paste0(".*(?=\\.", exten, ")"))
  list <- list_na[!is.na(list_na)]
  list
}

#' Provide normalized model names supported by treepplr
#'
#' @description Provide a list of all the model names supported by treepplr.
#' They can also be use to find data attach to these models
#' (see [treepplr::tp_data()])
#'
#' @return A list of model names.
#' @export
tp_model_name <- function() {
  list(
    custom = "custom",
    coin = "coin",
    hostrep3states = "hostrep3states",
    hostrep2states = "hostrep2states",
    treeinference = "treeinference",
    crbd = "crbd",
    clads = "clads"
  )
}
