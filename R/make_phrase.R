# Generated from create-xmasgifts.Rmd: do not edit by hand

#' Create the gift phrase for a specific day
#' 
#' The first step in writing the 12 Days of Christmas song is to pluralize the gift items.
#' @param day_num Number of the day in digits
#' @param item Name of the gift item
#' @param verb Name of the action the gift item
#' @param adjective Adjective to describe the gift item
#' @param location Location of the gift item
#' @import dplyr
#' @import stringr
#' @import glue
#' @import english
#' @export 
make_phrase <- function(day_num, item, verb, adjective, location) {
  
  item      <- replace_na(item, "")
  verb      <- replace_na(verb, "")
  adjective <- replace_na(adjective, "")
  location  <- replace_na(location, "")
  
  item <- if_else(day_num > 1, pluralize_gift(item), item)

  vowel_start <- str_detect(item, "^[aeiouAEIOU]")
  
  day_word <- case_when(
    day_num == 1 & vowel_start ~ "an",
    day_num == 1 & !vowel_start ~ "a",
    .default = as.character(english::english(day_num))
  )

  glue::glue("{day_word} {adjective} {item} {verb} {location}") |> 
    str_squish()
}
