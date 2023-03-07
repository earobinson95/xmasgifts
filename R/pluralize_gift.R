# Generated from create-xmasgifts.Rmd: do not edit by hand

#' Pluralize a gift item
#' 
#' The first step in writing the 12 Days of Christmas song is to pluralize the gift items.
#' @param item Name of a gift item
#' @import dplyr
#' @import stringr
#' @export 
pluralize_gift <- function(item){
  item <- case_when(
    ## Handle goose changing to geese
    str_detect(item, "oo") ~  str_replace(item, "oo", "ee"), 
    ## Handle "y" changing to "ies"
    str_detect(item, "y$") ~ str_replace(item, "y$", "ies"),
    ## Just use an "s" for everything else
    .default = str_c(item, "s")
  )
  return(item)
}
