parent_directory <- '/.../geophysical_monitoring/'
source_name <- paste(parent_directory, 'simulation_case/src/functions.R', sep = '')
source(source_name)
today <- format(Sys.time(), '%d%m%y')
load(paste(parent_directory, 'data/cases.RData', sep = ''))

indexes_for_voi <- new_partition_indexes(labels = labels_array, seed = 1234, size_of_partition = 300)
indexes_for_survey <- new_complement_indexes_balanced(labels = labels_array, indexes_for_voi, seed = 1234, size_of_partition = 100)

list_metrics <- list()

#%%%%%%%%%%%%%%%%%%%%%%%%%%#
# adaptive monitoring plan #
#%%%%%%%%%%%%%%%%%%%%%%%%%%#

metrics <- c()

load(paste(parent_directory, '/analyzing_results/results/list_adaptive_281122.RData', sep = ""))
res <- summarize_results(list_global, indexes_for_survey, labels_array, surveys = 7)
df <- res$df

surveys <- df %>% select(c(survey_1, survey_2, survey_3, survey_4, survey_5, survey_6, survey_7))
surveys[surveys == 'higher_seismic'] <- 0.65
surveys[surveys == 'lower_seismic'] <- 0.6
surveys[surveys == 'higher_csem'] <- 0.15
surveys[surveys == 'lower_csem'] <- 0.1
surveys[surveys == 'none'] <- 0.0

# average cost per ensemble
m <- as.numeric(as.matrix(surveys))
m <- matrix(m, ncol = 7, byrow = FALSE)
metrics[1] <- round(mean(rowSums(m, na.rm = TRUE)), 2)

# average number of surveys
metrics[2] <- mean(rowSums(m > 0.0, na.rm = TRUE))

# accuracy, FP and FN
cm <- res$summary
acc <- as.numeric(colSums(cm %>% filter(cat %in% c(1, 2)))[3])
metrics[3] <- acc # accuracy
metrics[4] <- cm[cm$cat == 0, 2] # FP
metrics[5] <- cm[cm$cat == 3, 2] # FN

list_metrics[[5]] <- metrics

#%%%%%%%%%%%%%%%%%%%%%%%%%%#
# fixed monitoring plan  1 #
#%%%%%%%%%%%%%%%%%%%%%%%%%%#
list_fixed_plans[[1]]

metrics <- c()

load(paste(parent_directory, '/analyzing_results/results/list_fixed_1_281122.RData', sep = ""))
res <- summarize_results(list_global, indexes_for_survey, labels_array, surveys = 7)
df <- res$df

surveys <- df %>% select(c(survey_1, survey_2, survey_3, survey_4, survey_5, survey_6, survey_7))
surveys[surveys == 'higher_seismic'] <- 0.65
surveys[surveys == 'lower_seismic'] <- 0.6
surveys[surveys == 'higher_csem'] <- 0.15
surveys[surveys == 'lower_csem'] <- 0.1
surveys[surveys == 'none'] <- 0.0

# average cost per ensemble
m <- as.numeric(as.matrix(surveys))
m <- matrix(m, ncol = 7, byrow = FALSE)
metrics[1] <- round(mean(rowSums(m, na.rm = TRUE)), 2)

# average number of surveys
metrics[2] <- mean(rowSums(m > 0.0, na.rm = TRUE))

# accuracy, FP and FN
cm <- res$summary
acc <- as.numeric(colSums(cm %>% filter(cat %in% c(1, 2)))[3])
metrics[3] <- acc # accuracy
metrics[4] <- cm[cm$cat == 0, 2] # FP
metrics[5] <- cm[cm$cat == 3, 2] # FN

list_metrics[[1]] <- metrics

#%%%%%%%%%%%%%%%%%%%%%%%%%%#
# fixed monitoring plan  2 #
#%%%%%%%%%%%%%%%%%%%%%%%%%%#
list_fixed_plans[[2]]

metrics <- c()

load(paste(parent_directory, '/analyzing_results/results/list_fixed_2_281122.RData', sep = ""))
res <- summarize_results(list_global, indexes_for_survey, labels_array, surveys = 7)
df <- res$df

surveys <- df %>% select(c(survey_1, survey_2, survey_3, survey_4, survey_5, survey_6, survey_7))
surveys[surveys == 'higher_seismic'] <- 0.65
surveys[surveys == 'lower_seismic'] <- 0.6
surveys[surveys == 'higher_csem'] <- 0.15
surveys[surveys == 'lower_csem'] <- 0.1
surveys[surveys == 'none'] <- 0.0

# average cost per ensemble
m <- as.numeric(as.matrix(surveys))
m <- matrix(m, ncol = 7, byrow = FALSE)
metrics[1] <- round(mean(rowSums(m, na.rm = TRUE)), 2)

# average number of surveys
metrics[2] <- mean(rowSums(m > 0.0, na.rm = TRUE))

# accuracy, FP and FN
cm <- res$summary
acc <- as.numeric(colSums(cm %>% filter(cat %in% c(1, 2)))[3])
metrics[3] <- acc # accuracy
metrics[4] <- cm[cm$cat == 0, 2] # FP
metrics[5] <- cm[cm$cat == 3, 2] # FN

list_metrics[[2]] <- metrics

#%%%%%%%%%%%%%%%%%%%%%%%%%%#
# fixed monitoring plan  3 #
#%%%%%%%%%%%%%%%%%%%%%%%%%%#
list_fixed_plans[[3]]

metrics <- c()

load(paste(parent_directory, '/analyzing_results/results/list_fixed_3_281122.RData', sep = ""))
res <- summarize_results(list_global, indexes_for_survey, labels_array, surveys = 7)
df <- res$df

surveys <- df %>% select(c(survey_1, survey_2, survey_3, survey_4, survey_5, survey_6, survey_7))
surveys[surveys == 'higher_seismic'] <- 0.65
surveys[surveys == 'lower_seismic'] <- 0.6
surveys[surveys == 'higher_csem'] <- 0.15
surveys[surveys == 'lower_csem'] <- 0.1
surveys[surveys == 'none'] <- 0.0

# average cost per ensemble
m <- as.numeric(as.matrix(surveys))
m <- matrix(m, ncol = 7, byrow = FALSE)
metrics[1] <- round(mean(rowSums(m, na.rm = TRUE)), 2)

# average number of surveys
metrics[2] <- mean(rowSums(m > 0.0, na.rm = TRUE))

# accuracy, FP and FN
cm <- res$summary
acc <- as.numeric(colSums(cm %>% filter(cat %in% c(1, 2)))[3])
metrics[3] <- acc # accuracy
metrics[4] <- cm[cm$cat == 0, 2] # FP
metrics[5] <- cm[cm$cat == 3, 2] # FN

list_metrics[[3]] <- metrics

#%%%%%%%%%%%%%%%%%%%%%%%%%%#
# fixed monitoring plan  4 #
#%%%%%%%%%%%%%%%%%%%%%%%%%%#
list_fixed_plans[[4]]

metrics <- c()

load(paste(parent_directory, '/analyzing_results/results/list_fixed_4_281122.RData', sep = ""))
res <- summarize_results(list_global, indexes_for_survey, labels_array, surveys = 7)
df <- res$df

surveys <- df %>% select(c(survey_1, survey_2, survey_3, survey_4, survey_5, survey_6, survey_7))
surveys[surveys == 'higher_seismic'] <- 0.65
surveys[surveys == 'lower_seismic'] <- 0.6
surveys[surveys == 'higher_csem'] <- 0.15
surveys[surveys == 'lower_csem'] <- 0.1
surveys[surveys == 'none'] <- 0.0

# average cost per ensemble
m <- as.numeric(as.matrix(surveys))
m <- matrix(m, ncol = 7, byrow = FALSE)
metrics[1] <- round(mean(rowSums(m, na.rm = TRUE)), 2)

# average number of surveys
metrics[2] <- mean(rowSums(m > 0.0, na.rm = TRUE))

# accuracy, FP and FN
cm <- res$summary
acc <- as.numeric(colSums(cm %>% filter(cat %in% c(1, 2)))[3])
metrics[3] <- acc # accuracy
metrics[4] <- cm[cm$cat == 0, 2] # FP
metrics[5] <- cm[cm$cat == 3, 2] # FN

list_metrics[[4]] <- metrics
