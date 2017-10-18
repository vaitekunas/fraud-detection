###############################################################################
#
# Credit card fraud detection 
# https://www.kaggle.com/dalpozz/creditcardfraud
#
# Author: Mindaugas Vaitekunas
# Blogpost: https://blog.vaitekunas.com/credit-card-fraud-detection/
#
# -----------------------------------------------------------------------------
#
# Project utilities
#
###############################################################################

#' Checks if all required entries are included in the opts_list
#'
#' @param req [vector] - vector of required options
#' @param opts_list [list] - named list of all relevant project options
#' 
#' @return [void]
#'
fraud.utils.required_options(req, opts_list) {
  matches <- req %in% names(opts_list)
  if(!all(matches)) {
    stop(paste0("Missing options in 'fraud.options': ",paste0(req[!matches],collapse=', ')))
  }
}

#' Validates options and sets defaults if any values are missing
#'
#' @param opts_list [list] - named list of all relevant project options
#'
#' @return [list] - an updated list
#'
fraud.utils.validate_options <- function(opts_list) {
  
}

#' Logs a message 
#' 
#' @param sender [string] - sender's name
#' @param message [string] - message to be logged
#'
#' @return [void]
#'
fraud.utils.log <- function(sender, message) {
  now <- format(Sys.time(), "%Y-%m-%d %H:%M:%S")
  
  cat(paste0("[",now,"] ",sender,": ",message))
  
}