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
# Project includes
#
###############################################################################

fraud_paths <- c("src/libraries.R",
                 "src/misc/utils.R",
                 "src/data/data.R",
                 "src/models/training_utilities.R",
                 "src/models/training.R"
                 )

for(path in paths) {
  source(path)
}