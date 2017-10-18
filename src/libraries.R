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
# Library requirements
#
###############################################################################

# Package requirements for this project
packages <- c("dplyr","magrittr","ggplot2")

# Install missing libraries
missing <- packages[!(packages %in% utils::installed.packages()[,1])]
if(length(missing) > 0) {
  print(paste("Some packages are missing and need to be installed:",paste(missing, collapse=",")))
  install.packages(missing)
}

# Load packages
for(package in packages) {
  suppressPackageStartupMessages(library(package, character.only = T, quietly = T))
  
}