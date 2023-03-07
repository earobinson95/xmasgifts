# Generated from create-xmasgifts.Rmd: do not edit by hand  
testthat::test_that("pluralize_gift works", {
  testthat::expect_equal(pluralize_gift("hen"), "hens")
  testthat::expect_equal(pluralize_gift("goose"), "geese")
  testthat::expect_equal(pluralize_gift("lady"), "ladies")
})

