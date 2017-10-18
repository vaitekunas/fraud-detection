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
# Training functions 
#
###############################################################################

fraud.cv %>%
  fraud.sampling(sampling = opt_sampling_method, minority_quote = opt_sampling_minority_quote) %>%
  fraud.train() %T>%