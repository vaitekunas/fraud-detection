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
# Main file
#
###############################################################################

# This is a simple credit card fraud detection project based on a kaggle dataset
# (https://www.kaggle.com/dalpozz/creditcardfraud)
#
# This dataset is extremely unbalanced (x observations in the minority class vs 
# y observations in the majority class)
#
# The main goal of this project is to contrast a naive approach (logistic 
# regression on an unbalanced dataset with feature selection based on training 
# dataset) to a more sophisticated approach (an ensemble of models optimized on 
# the validation dataset)
#
# Model estimation and feature/model selection is fully automated using a
# the validation dataset
#
#

# Work directory
setwd("~/repositories/Github/vaitekunas/fraud-detection")

# Load required libraries and project files
source("src/includes.R")

###############################################################################
#
# Project options
#
# To use all defaults set fraud.options = list()
# Overwrite settings by using the option name, e.g. 
# fraud.options[["opt_train_models"]] <- 1
#
###############################################################################

# Load project config
# Will create a fraud.options variable
source("main_config.R")

# Validate project options.
# Will abort if any setting is incorrect, but will proceed
# and use default values if some are missing
fraud.options <- fraud.utils.validate_options(fraud.options)

###############################################################################
#
# Get data
#
# Kaggle requires logging in prior to downloading any datasets, so if this is
# your first time running this project, go to https://www.kaggle.com, log in
# and download 
# https://www.kaggle.com/dalpozz/creditcardfraud/downloads/creditcardfraud.zip
# to data/kaggle_data.zip
#
# The raw data will be processed, creating a couple of new features and removing
# unused ones. Since this dataset contains mostly principal components, i.e.
# orthogonalized anonymized data, there's not a lot of feature engineering that
# can be done here.
#
# The final data list 'fraud.data' contains three elements:
# * all - the whole dataset
# * training - the training+validation dataset
# * test - the test dataset
#
###############################################################################

fraud.data <- fraud.data.get(fraud.options)

###############################################################################
#
# Descriptive statistics
#
###############################################################################

fraud.descriptive_statistics(fraud.data)

###############################################################################
#
# Benchmark model
#
###############################################################################

fraud.benchmark_model <- fraud.data %T>%
                         fraud.train_initialization %>%
                         fraud.train_benchmark(fraud.options) %T>%
                         fraud.train_summary(fraud.options)

###############################################################################
#
# Optimized models
#
###############################################################################

fraud.models <- fraud.data %T>%
                fraud.train_initialization(fraud.options) %>%
                fraud.train(fraud.options) %T>%
                fraud.train_summary(fraud.options)
  
###############################################################################
#
# Ensemble
#
###############################################################################

fraud.ensemble_model <- fraud.models %>% 
                        fraud.ensemble

###############################################################################
#
# Test performance
#
###############################################################################

c(fraud.benchmark_model,
  fraud.models,
  fraud.ensemble_model) %>% fraud.test_performance(fraud.options)

###############################################################################
#
# Retrain on all data
#
###############################################################################

fraud.final_models <- fraud.data %>%
                      fraud.train(fraud.options, optim=F, use_all_data=T) %T>%
                      fraud.train_summary(fraud.options)

fraud.final_ensemble_model <- fraud.models %>% 
                              fraud.ensemble %T>% 
                              fraud.export_model("ensemble")

