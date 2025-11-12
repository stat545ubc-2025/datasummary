test_that("group_summary function works well for different kinds of input", {
  # example 1: test that the output is correct with no input columns
  # creat the correct answer first
  penguins_removed_na <- penguins %>% tidyr::drop_na()
  answer <- tibble::tibble(
    mean_bill_len = mean(penguins_removed_na$bill_len),
    mean_bill_dep = mean(penguins_removed_na$bill_dep),
    mean_flipper_len = mean(penguins_removed_na$flipper_len),
    mean_body_mass = mean(penguins_removed_na$body_mass),
    mean_year = mean(penguins_removed_na$year),
    num_of_unique_species = length(unique(penguins_removed_na$species)),
    num_of_unique_island = length(unique(penguins_removed_na$island)),
    num_of_unique_sex = length(unique(penguins_removed_na$sex)),
    n = nrow(penguins_removed_na)
  )
  expect_equal(group_summary(penguins), answer)

  # example 2: test that the function runs into an error when the input is not
  # a data frame or tibble
  vec = c(1, 2, 3)
  expect_error(group_summary(vec, species))

  # example 3: test that the function runs into an error when the input column
  # does not exist in the dataset
  expect_error(group_summary(penguins, specie))
})
