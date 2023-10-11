#STEP 1.  SUBSET CREATION

StudentPerformanceDataset <- read.csv("/home/ki3ani/BBT4206-R-Lab3of15-DataImputation-lumin/markdown/performance-dataset.csv")


# Load the necessary library
# Load the necessary library
library(dplyr)

# View the column names of your dataset
colnames(StudentPerformanceDataset)

# Create a subset of the StudentPerformanceDataset
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
rand_ind <- sample(seq_len(n), 30)
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

# Where are missing values located (the shaded re