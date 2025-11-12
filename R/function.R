#' @title Summarise the dataset by group
#' @description
#' For each group, calculate the number of rows, numeric columns' mean value
#' and categorical columns' number of unique values
#' @importFrom magrittr %>%
#'
#' @param data dataset to summarise
#' @param ... ellipses, column(s) to group by
#'
#' @return the summary result
#'
#' @examples
#' group_summary(penguins, island)
#' group_summary(penguins, species, island)
#'
#' @export
group_summary <- function(data, ...) {

  # check if the input data is a data frame or tibble
  if (!is.data.frame(data)){
    stop("Input must be a data frame or tibble.")
  }

  vars <- rlang::ensyms(...)                 # get the arguments as symbols
  for (var in vars) {
    # check if the arguments are columns in data
    if (!(rlang::as_string(var) %in% names(data))) {
      stop(paste("Column", rlang::as_string(var), "does NOT exist in the dataset"))
    }
  }

  summary_info <- data %>%
    tidyr::drop_na() %>%                   # drop rows with missing data
    dplyr::group_by(...) %>%               # group by the input column(s)
    dplyr::summarise(
      # calculate the mean value for numeric columns
      dplyr::across(dplyr::where(is.numeric), ~mean(.x), .names="mean_{.col}"),
      # calculate the number of unique values for categorical columns
      dplyr::across(dplyr::where(is.factor), ~dplyr::n_distinct(.x), .names = "num_of_unique_{.col}"),
      n = dplyr::n(),                    # calculate the row number
    )

  return(summary_info)
}
