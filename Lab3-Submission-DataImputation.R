lapply(.libPaths(), list.files)

if (!is.element("languageserver", installed.packages()[, 1])) {
  install.packages("languageserver", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("languageserver")

# Introduction ----
# Data imputation, also known as missing data imputation, is a technique used
# in data analysis and statistics to fill in missing values in a dataset.
# Missing data can occur due to various reasons, such as equipment malfunction,
# human error, or non-response in surveys.

# Imputing missing data is important because many statistical analysis methods
# and Machine Learning algorithms require complete datasets to produce accurate
# and reliable results. By filling in the missing values, data imputation helps
# to preserve the integrity and usefulness of the dataset.

## dplyr ----
if (!is.element("dplyr", installed.packages()[, 1])) {
  install.packages("dplyr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("dplyr")

## naniar ----
# Documentation:
#   https://cran.r-project.org/package=naniar or
#   https://www.rdocumentation.org/packages/naniar/versions/1.0.0
if (!is.element("naniar", installed.packages()[, 1])) {
  install.packages("naniar", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("naniar")

## ggplot2 ----
# We require the "ggplot2" package to create more appealing visualizations
if (!is.element("ggplot2", installed.packages()[, 1])) {
  install.packages("ggplot2", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("ggplot2")

## MICE ----
# We use the MICE package to perform data imputation
if (!is.element("mice", installed.packages()[, 1])) {
  install.packages("mice", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("mice")

## Amelia ----
if (!is.element("Amelia", installed.packages()[, 1])) {
  install.packages("Amelia", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("Amelia")

## readr ----
if (require("readr")) {
  require("readr")
} else {
  install.packages("readr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

# STEP 3. Load the Dataset ----
student_performance_dataset <-
  read_csv("/home/ki3ani/BBT4206-R-Lab3of15-DataImputation-lumin/data/performance-dataset.csv",
           col_types =
             cols(
               class_group = col_factor(levels = c("A", "B", "C")),
               gender = col_factor(levels = c("1", "0")),
               YOB = col_date(format = "%Y"),
               regret_choosing_bi = col_factor(levels = c("1", "0")),
               drop_bi_now = col_factor(levels = c("1", "0")),
               motivator = col_factor(levels = c("1", "0")),
               read_content_before_lecture =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               anticipate_test_questions =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               answer_rhetorical_questions =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               find_terms_I_do_not_know =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               copy_new_terms_in_reading_notebook =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               take_quizzes_and_use_results =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               reorganise_course_outline =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               write_down_important_points =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               space_out_revision =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               studying_in_study_group =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               schedule_appointments =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               goal_oriented = col_factor(levels = c("1", "0")),
               spaced_repetition =
                 col_factor(levels = c("1", "2", "3", "4")),
               testing_and_active_recall =
                 col_factor(levels = c("1", "2", "3", "4")),
               interleaving = col_factor(levels = c("1", "2", "3", "4")),
               categorizing = col_factor(levels = c("1", "2", "3", "4")),
               retrospective_timetable =
                 col_factor(levels = c("1", "2", "3", "4")),
               cornell_notes = col_factor(levels = c("1", "2", "3", "4")),
               sq3r = col_factor(levels = c("1", "2", "3", "4")),
               commute = col_factor(levels = c("1", "2", "3", "4")),
               study_time = col_factor(levels = c("1", "2", "3", "4")),
               repeats_since_Y1 = col_integer(),
               paid_tuition = col_factor(levels = c("0", "1")),
               free_tuition = col_factor(levels = c("0", "1")),
               extra_curricular = col_factor(levels = c("0", "1")),
               sports_extra_curricular = col_factor(levels = c("0", "1")),
               exercise_per_week = col_factor(levels = c("0", "1", "2", "3")),
               meditate = col_factor(levels = c("0", "1", "2", "3")),
               pray = col_factor(levels = c("0", "1", "2", "3")),
               internet = col_factor(levels = c("0", "1")),
               laptop = col_factor(levels = c("0", "1")),
               family_relationships =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               friendships = col_factor(levels = c("1", "2", "3", "4", "5")),
               romantic_relationships =
                 col_factor(levels = c("0", "1", "2", "3", "4")),
               spiritual_wellnes =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               financial_wellness =
                 col_factor(levels = c("1", "2", "3", "4", "5")),
               health = col_factor(levels = c("1", "2", "3", "4", "5")),
               day_out = col_factor(levels = c("0", "1", "2", "3")),
               night_out = col_factor(levels = c("0", "1", "2", "3")),
               alcohol_or_narcotics =
                 col_factor(levels = c("0", "1", "2", "3")),
               mentor = col_factor(levels = c("0", "1")),
               mentor_meetings = col_factor(levels = c("0", "1", "2", "3")),
               `Attendance Waiver Granted: 1 = Yes, 0 = No` =
                 col_factor(levels = c("0", "1")),
               GRADE = col_factor(levels = c("A", "B", "C", "D", "E"))),
           locale = locale())


# Select the variables you want to include in the analysis
# Define the selected variables for imputation
selected_variables <- c(
  "gender", "YOB", "spaced_repetition", "testing_and_active_recall", "motivator", "health", 
  "family_relationships", "mentor", "night_out", "alcohol_or_narcotics", "GRADE"
)

# Select the chosen variables from the dataset
imputed_data <- student_performance_dataset %>%
  select(all_of(selected_variables))

# STEP 3. Confirm Missing Data in the Dataset Before Imputation
# Check for missing values in the dataset
any_missing_values <- any_na(imputed_data)

# Count the number of missing values in each variable
missing_counts <- imputed_data %>% is.na() %>% colSums()

# Calculate the percentage of missing data in the entire dataset
missing_percentage <- prop_miss(imputed_data)

# Summarize missing values by variable
variable_missing_summary <- miss_var_summary(imputed_data)

# Summarize missing values by observation
observation_missing_summary <- miss_case_summary(imputed_data)

# Identify variables with the most missing values
variables_with_most_missing <- gg_miss_var(imputed_data)

# Check if 'spaced_repetition' is a factor variable
is_factor_spaced_repetition <- is.factor(imputed_data$spaced_repetition)

# Create a heatmap showing missingness by 'spaced_repetition'
heatmap_missing_by_spaced_repetition <- gg_miss_fct(imputed_data, fct = spaced_repetition)

# Display the results
any_missing_values
missing_counts
missing_percentage
variable_missing_summary
observation_missing_summary
variables_with_most_missing
is_factor_spaced_repetition
heatmap_missing_by_spaced_repetition

# STEP 4. Confirm the "missingness" in the Dataset before Imputation
# Are there missing values in the dataset?
any_na(imputed_data)

# How many missing values?
n_miss(imputed_data)

# What is the percentage of missing data in the entire dataset?
prop_miss(imputed_data)

# How many missing values does each predictor variable have?
predictor_vars <- imputed_data %>%
  select(
    gender, YOB, spaced_repetition,
    testing_and_active_recall, motivator, health,
    family_relationships, mentor, night_out,
    alcohol_or_narcotics, GRADE
  )

# Check for missing values in predictor variables
n_miss(predictor_vars)

# What is the number and percentage of missing values grouped by each variable?
miss_var_summary(predictor_vars)

# What is the number and percentage of missing values grouped by each observation?
miss_case_summary(predictor_vars)

# Check if the data types of predictor variables are suitable for Random Forest imputation
sapply(predictor_vars, class)

# Correct the data types if needed (e.g., if any variables are not in the right data type)

# Perform multivariate imputation using Random Forest imputation
# Make sure to adjust num.trees as needed
imputed_data_mice <- mice(predictor_vars, m = 11, seed = 7, method = "rf", num.trees = 100)

# Visualize the imputed data with strip-plots
stripplot(imputed_data_mice)

# Create a complete data frame from imputed data
imputed_data_complete <- complete(imputed_data_mice)

# STEP 5. Confirm the "missingness" in the Imputed Dataset

# A textual confirmation that the dataset has no more missing values in any feature:
miss_var_summary(imputed_data_complete)

# A visual confirmation that the dataset has no more missing values in any feature:
Amelia::missmap(imputed_data_complete)

# Are there missing values in the dataset?
any_na(imputed_data_complete)

# How many missing values?
n_miss(imputed_data_complete)

# What is the percentage of missing data in the entire dataset?
prop_miss(imputed_data_complete)

# How many missing values does each variable have?
imputed_data_complete %>% is.na() %>% colSums()

# What is the number and percentage of missing values grouped by each variable?
miss_var_summary(imputed_data_complete)

# What is the number and percentage of missing values grouped by each observation?
miss_case_summary(imputed_data_complete)

# Which variables contain the most missing values?
gg_miss_var(imputed_data_complete)

# Where are missing values located (the shaded regions in the plot)?
vis_miss(imputed_data_complete) + theme(axis.text.x = element_text(angle = 80))

# Create a heatmap of "missingness" broken down by the 'gender' variable
# Confirm that 'gender' is a categorical variable
is.factor(imputed_data_complete$gender)

# Create the visualization
gg_miss_fct(imputed_data_complete, fct = gender)
