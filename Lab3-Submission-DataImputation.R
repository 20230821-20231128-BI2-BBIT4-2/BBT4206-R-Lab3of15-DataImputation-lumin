#STEP 1.  SUBSET CREATION

StudentPerformanceDataset <- read.csv("data/StudentPerformanceDataset.csv")


# Load the necessary library
library(dplyr)

StudentPerformanceSubset <- StudentPerformanceDataset %>%
  select(`A...1..I.am.enjoying.the.subject`,
         `A...2..Classes.start.and.end.on.time`,
         `A...4..The.subject.content.is.delivered.according.to.the.course.outline.and.meets.my.expectations`,
         `TOTAL...Coursework.TOTAL...EXAM..100..`,
         `EXAM..x.60..60..`,
         `Absenteeism.Percentage`,
         `CAT.2..8....x.100.x.100`,
         `CAT.1..8....x.38.x.100`,
         `Lab.Work..7...x.25.x.100`,
         `Lab.4...2.h.....Linear.Discriminant.Analysis..x.5`)

##data_type2 <- typeof('Absenteeism Percentage')
##print(data_type2)

## Now we select 300 observations that would then be included in the dataset

n <- nrow(StudentPerformanceDataset)
rand_ind <- sample(seq_len(n), 100)
StudentPerformanceSubset <- StudentPerformanceDataset[rand_ind, ]

# STEP 2. Check the missingness before Imputation

any_na(StudentPerformanceSubset)

# How many?
n_miss(StudentPerformanceSubset)

# What is the percentage of missing data in the entire dataset?
prop_miss(StudentPerformanceSubset)

# How many missing values does each variable have?
StudentPerformanceSubset %>% is.na() %>% colSums()

# What is the number and percentage of missing values grouped by
# each variable?
miss_var_summary(StudentPerformanceSubset)

# What is the number and percentage of missing values grouped by
# each observation?
miss_case_summary(StudentPerformanceSubset)

# Which variables contain the most missing values?
gg_miss_var(StudentPerformanceSubset)

# Where are missing values located (the shaded regions in the plot)?
vis_miss(StudentPerformanceSubset) + theme(axis.text.x = element_text(angle = 80))

# Which combinations of variables are missing together?
gg_miss_upset(StudentPerformanceSubset)

# We can also create a heatmap of "missingness" broken down by "YOB"
# First, confirm that the "YOB" variable is a categorical variable
is.factor(StudentPerformanceSubset$YOB)
# Second, create the visualization
gg_miss_fct(StudentPerformanceSubset, fct = YOB)


#STEP 3. Perform Data Imputation
 ## MAP
StudentPerformanceSubset <- StudentPerformanceSubset %>%
  mutate(MAP = commute + (1 / 3) * (study_time - commute))
#save the variables that are at least "somewhat correlated" (r > 0.3).
somewhat_correlated_variables <- quickpred(StudentPerformanceSubset, mincor = 0.3)

StudentPerformanceSubset_mice <- mice(StudentPerformanceSubset, m = 11, method = "pmm",
                            seed = 7,
                            predictorMatrix = somewhat_correlated_variables)
                            
# Scatter plots to visualize how random the imputed data is in each of the 11 datasets

stripplot(StudentPerformanceSubset_mice,
          MAP ~ commute | .imp,
          pch = 20, cex = 1)

stripplot(StudentPerformanceSubset_mice,
          MAP ~ study_time | .imp,
          pch = 20, cex = 1)
# Impute the missing data
StudentPerformanceSubset_imputed <- mice::complete(StudentPerformanceSubset_mice, 1)


#STEP 4.Confirm the "missingness" in the Imputed Dataset 

miss_var_summary(StudentPerformanceSubset_imputed)

# A visual confirmation that the dataset has no more missing values in any
# feature:
Amelia::missmap(StudentPerformanceSubset_imputed)


# Are there missing values in the dataset?
any_na(StudentPerformanceSubset_imputed)

# How many?
n_miss(StudentPerformanceSubset_imputed)

# What is the percentage of missing data in the entire dataset?
prop_miss(StudentPerformanceSubset_imputed)

# How many missing values does each variable have?
StudentPerformanceSubset_imputed %>% is.na() %>% colSums()

# What is the number and percentage of missing values grouped by
# each variable?
miss_var_summary(StudentPerformanceSubset_imputed)

# What is the number and percentage of missing values grouped by
# each observation?
miss_case_summary(StudentPerformanceSubset_imputed)

# Which variables contain the most missing values?
gg_miss_var(StudentPerformanceSubset_imputed)


# Where are missing values located ?
vis_miss(StudentPerformanceSubset_imputed) + theme(axis.text.x = element_text(angle = 80))

# Which combinations of variables are missing together?

gg_miss_upset(StudentPerformanceSubset_imputed)

# Create a heatmap of "missingness"
# First, confirm that the "YOB" variable is a categorical variable
is.factor(StudentPerformanceSubset_imputed$YOB)
# Second, create the visualization
gg_miss_fct(StudentPerformanceSubset_imputed, fct = YOB)
