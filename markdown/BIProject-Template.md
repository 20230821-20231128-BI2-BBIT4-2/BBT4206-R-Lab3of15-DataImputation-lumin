Business Intelligence Project
================
<Specify your name here>
<Specify the date when you submitted the lab>

- [Student Details](#student-details)
- [Setup Chunk](#setup-chunk)
- [Understanding the Dataset (Exploratory Data Analysis
  (EDA))](#understanding-the-dataset-exploratory-data-analysis-eda)
  - [Loading the Dataset](#loading-the-dataset)
    - [Source:](#source)
    - [Reference:](#reference)
- [Loading the Packages](#loading-the-packages)
- [Step 1:Define the selected variables for
  imputation](#step-1define-the-selected-variables-for-imputation)
- [Step 2:Confirm Missing Data in the Dataset Before
  Imputation](#step-2confirm-missing-data-in-the-dataset-before-imputation)
- [Step 3: Perform multivariate imputation using Random Forest
  imputation](#step-3-perform-multivariate-imputation-using-random-forest-imputation)
- [Step 4. Confirm the “missingness” in the Imputed
  Dataset](#step-4-confirm-the-missingness-in-the-imputed-dataset)

# Student Details

|                                              |                                               |
|----------------------------------------------|-----------------------------------------------|
| **Student ID Number**                        | 112827 , 123324, 134265                       |
| **Student Name**                             | Mungai Kenneth, Kelly Noella, Emmanuel Kiptoo |
| **BBIT 4.2 Group**                           | A, B                                          |
| **BI Project Group Name/ID (if applicable)** | Lumin                                         |

# Setup Chunk

**Note:** the following KnitR options have been set as the global
defaults: <BR>
`knitr::opts_chunk$set(echo = TRUE, warning = FALSE, eval = TRUE, collapse = FALSE, tidy = TRUE)`.

More KnitR options are documented here
<https://bookdown.org/yihui/rmarkdown-cookbook/chunk-options.html> and
here <https://yihui.org/knitr/options/>.

# Understanding the Dataset (Exploratory Data Analysis (EDA))

## Loading the Dataset

### Source:

The dataset that was used can be downloaded here: *\<provide a link\>*

### Reference:

*\<Cite the dataset here using APA\>  
Refer to the APA 7th edition manual for rules on how to cite datasets:
<https://apastyle.apa.org/style-grammar-guidelines/references/examples/data-set-references>*

# Loading the Packages

``` r
lapply(.libPaths(), list.files)
```

    ## [[1]]
    ##   [1] "00LOCK-coin"     "abind"           "Amelia"          "AsioHeaders"    
    ##   [5] "askpass"         "backports"       "base64enc"       "BayesFactor"    
    ##   [9] "bit"             "bit64"           "bitops"          "BradleyTerry2"  
    ##  [13] "brew"            "brglm"           "brio"            "broom"          
    ##  [17] "bslib"           "cachem"          "Cairo"           "callr"          
    ##  [21] "car"             "carData"         "caret"           "caTools"        
    ##  [25] "chromote"        "circlize"        "classInt"        "cli"            
    ##  [29] "clipr"           "clock"           "coda"            "coin"           
    ##  [33] "collections"     "colorspace"      "colourpicker"    "combinat"       
    ##  [37] "commonmark"      "contfrac"        "corpcor"         "corrplot"       
    ##  [41] "covr"            "cowplot"         "cpp11"           "crayon"         
    ##  [45] "crosstalk"       "Cubist"          "curl"            "cyclocomp"      
    ##  [49] "data.table"      "DBI"             "dendextend"      "desc"           
    ##  [53] "deSolve"         "diagram"         "diffobj"         "digest"         
    ##  [57] "dplyr"           "DT"              "e1071"           "earth"          
    ##  [61] "ellipse"         "ellipsis"        "elliptic"        "emmeans"        
    ##  [65] "estimability"    "evaluate"        "factoextra"      "FactoMineR"     
    ##  [69] "fansi"           "farver"          "fastICA"         "fastmap"        
    ##  [73] "flashClust"      "fontawesome"     "forcats"         "foreach"        
    ##  [77] "formatR"         "formattable"     "Formula"         "fs"             
    ##  [81] "future"          "future.apply"    "gam"             "generics"       
    ##  [85] "ggforce"         "ggplot2"         "ggpubr"          "ggraph"         
    ##  [89] "ggrepel"         "ggsci"           "ggsignif"        "glmnet"         
    ##  [93] "GlobalOptions"   "globals"         "glue"            "gower"          
    ##  [97] "gplots"          "graphlayouts"    "gridExtra"       "gtable"         
    ## [101] "gtools"          "hardhat"         "haven"           "highr"          
    ## [105] "hms"             "htmltools"       "htmlwidgets"     "httpuv"         
    ## [109] "httr"            "hypergeo"        "igraph"          "ipred"          
    ## [113] "isoband"         "ISwR"            "iterators"       "janeaustenr"    
    ## [117] "jomo"            "jpeg"            "jquerylib"       "jsonlite"       
    ## [121] "kableExtra"      "kernlab"         "klaR"            "knitr"          
    ## [125] "labeling"        "labelled"        "languageserver"  "later"          
    ## [129] "lava"            "lazyeval"        "leaps"           "libcoin"        
    ## [133] "lifecycle"       "lintr"           "listenv"         "lme4"           
    ## [137] "lubridate"       "magick"          "magrittr"        "markdown"       
    ## [141] "Matrix"          "MatrixModels"    "matrixStats"     "mda"            
    ## [145] "memery"          "memoise"         "mice"            "miceadds"       
    ## [149] "mime"            "miniUI"          "minqa"           "mitml"          
    ## [153] "mitools"         "mlbench"         "MLmetrics"       "ModelMetrics"   
    ## [157] "modeltools"      "multcomp"        "multcompView"    "munsell"        
    ## [161] "mvtnorm"         "naniar"          "NHANES"          "nloptr"         
    ## [165] "norm"            "numDeriv"        "openssl"         "ordinal"        
    ## [169] "pamr"            "pan"             "parallelly"      "pbapply"        
    ## [173] "pbkrtest"        "pillar"          "pkgconfig"       "pkgload"        
    ## [177] "plotmo"          "plotrix"         "pls"             "plyr"           
    ## [181] "png"             "polyclip"        "polynom"         "praise"         
    ## [185] "prettyunits"     "pROC"            "processx"        "prodlim"        
    ## [189] "profileModel"    "progress"        "progressr"       "promises"       
    ## [193] "proxy"           "ps"              "purrr"           "quantreg"       
    ## [197] "questionr"       "qvcalc"          "R.cache"         "R.methodsS3"    
    ## [201] "R.oo"            "R.rsp"           "R.utils"         "R6"             
    ## [205] "radarchart"      "randomForest"    "ranger"          "RANN"           
    ## [209] "rappdirs"        "RColorBrewer"    "Rcpp"            "RcppArmadillo"  
    ## [213] "RcppEigen"       "readr"           "recipes"         "rematch2"       
    ## [217] "remotes"         "renv"            "reshape2"        "rex"            
    ## [221] "rlang"           "rmarkdown"       "ROCR"            "ROSE"           
    ## [225] "roxygen2"        "rprojroot"       "rstatix"         "rstudioapi"     
    ## [229] "rvest"           "s2"              "sandwich"        "sass"           
    ## [233] "scales"          "scatterplot3d"   "selectr"         "shape"          
    ## [237] "shiny"           "shinyBS"         "shinycssloaders" "shinyjs"        
    ## [241] "showtext"        "showtextdb"      "SnowballC"       "sourcetools"    
    ## [245] "SparseM"         "spls"            "SQUAREM"         "stringi"        
    ## [249] "stringr"         "strucchange"     "styler"          "subselect"      
    ## [253] "superpc"         "svglite"         "sys"             "sysfonts"       
    ## [257] "systemfonts"     "TeachingDemos"   "testthat"        "TH.data"        
    ## [261] "themis"          "tibble"          "tidygraph"       "tidyr"          
    ## [265] "tidyselect"      "tidytext"        "timechange"      "timeDate"       
    ## [269] "tinytex"         "tokenizers"      "tweenr"          "tzdb"           
    ## [273] "ucminf"          "UpSetR"          "utf8"            "vctrs"          
    ## [277] "viridis"         "viridisLite"     "visdat"          "vroom"          
    ## [281] "waldo"           "webshot"         "webshot2"        "websocket"      
    ## [285] "widyr"           "withr"           "wk"              "wordcloud2"     
    ## [289] "xfun"            "xml2"            "xmlparsedata"    "xtable"         
    ## [293] "yaml"            "yarrr"           "zoo"            
    ## 
    ## [[2]]
    ## character(0)
    ## 
    ## [[3]]
    ## character(0)
    ## 
    ## [[4]]
    ##  [1] "base"         "boot"         "class"        "cluster"      "codetools"   
    ##  [6] "compiler"     "datasets"     "foreign"      "graphics"     "grDevices"   
    ## [11] "grid"         "KernSmooth"   "lattice"      "MASS"         "Matrix"      
    ## [16] "methods"      "mgcv"         "nlme"         "nnet"         "parallel"    
    ## [21] "rpart"        "spatial"      "splines"      "stats"        "stats4"      
    ## [26] "survival"     "tcltk"        "tools"        "translations" "utils"

``` r
if (!is.element("languageserver", installed.packages()[, 1])) {
  install.packages("languageserver", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("languageserver")
```

    ## Loading required package: languageserver

``` r
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
```

    ## Loading required package: dplyr

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
## naniar ----
# Documentation:
#   https://cran.r-project.org/package=naniar or
#   https://www.rdocumentation.org/packages/naniar/versions/1.0.0
if (!is.element("naniar", installed.packages()[, 1])) {
  install.packages("naniar", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("naniar")
```

    ## Loading required package: naniar

``` r
## ggplot2 ----
# We require the "ggplot2" package to create more appealing visualizations
if (!is.element("ggplot2", installed.packages()[, 1])) {
  install.packages("ggplot2", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("ggplot2")
```

    ## Loading required package: ggplot2

``` r
## MICE ----
# We use the MICE package to perform data imputation
if (!is.element("mice", installed.packages()[, 1])) {
  install.packages("mice", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("mice")
```

    ## Loading required package: mice

    ## 
    ## Attaching package: 'mice'

    ## The following object is masked from 'package:stats':
    ## 
    ##     filter

    ## The following objects are masked from 'package:base':
    ## 
    ##     cbind, rbind

``` r
## Amelia ----
if (!is.element("Amelia", installed.packages()[, 1])) {
  install.packages("Amelia", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("Amelia")
```

    ## Loading required package: Amelia

    ## Loading required package: Rcpp

    ## ## 
    ## ## Amelia II: Multiple Imputation
    ## ## (Version 1.8.1, built: 2022-11-18)
    ## ## Copyright (C) 2005-2023 James Honaker, Gary King and Matthew Blackwell
    ## ## Refer to http://gking.harvard.edu/amelia/ for more information
    ## ##

``` r
## readr ----
if (require("readr")) {
  require("readr")
} else {
  install.packages("readr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: readr

``` r
library(readr)
```

``` r
# Load the readr package
library(readr)
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
```

# Step 1:Define the selected variables for imputation

``` r
selected_variables <- c(
  "gender", "YOB", "spaced_repetition", "testing_and_active_recall", "motivator", "health", 
  "family_relationships", "mentor", "night_out", "alcohol_or_narcotics", "GRADE"
)

# Select the chosen variables from the dataset
imputed_data <- student_performance_dataset %>%
  select(all_of(selected_variables))
library(readr)
```

# Step 2:Confirm Missing Data in the Dataset Before Imputation

``` r
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
```

    ## [1] TRUE

``` r
missing_counts
```

    ##                    gender                       YOB         spaced_repetition 
    ##                         0                         0                         0 
    ## testing_and_active_recall                 motivator                    health 
    ##                         0                         0                         1 
    ##      family_relationships                    mentor                 night_out 
    ##                         1                         1                         1 
    ##      alcohol_or_narcotics                     GRADE 
    ##                         1                         0

``` r
missing_percentage
```

    ## [1] 0.00450045

``` r
variable_missing_summary
```

    ## # A tibble: 11 × 3
    ##    variable                  n_miss pct_miss
    ##    <chr>                      <int>    <dbl>
    ##  1 health                         1    0.990
    ##  2 family_relationships           1    0.990
    ##  3 mentor                         1    0.990
    ##  4 night_out                      1    0.990
    ##  5 alcohol_or_narcotics           1    0.990
    ##  6 gender                         0    0    
    ##  7 YOB                            0    0    
    ##  8 spaced_repetition              0    0    
    ##  9 testing_and_active_recall      0    0    
    ## 10 motivator                      0    0    
    ## 11 GRADE                          0    0

``` r
observation_missing_summary
```

    ## # A tibble: 101 × 3
    ##     case n_miss pct_miss
    ##    <int>  <int>    <dbl>
    ##  1    88      5     45.5
    ##  2     1      0      0  
    ##  3     2      0      0  
    ##  4     3      0      0  
    ##  5     4      0      0  
    ##  6     5      0      0  
    ##  7     6      0      0  
    ##  8     7      0      0  
    ##  9     8      0      0  
    ## 10     9      0      0  
    ## # ℹ 91 more rows

``` r
variables_with_most_missing
```

![](BIProject-Template_files/figure-gfm/code%20chunk%202-1.png)<!-- -->

``` r
is_factor_spaced_repetition
```

    ## [1] TRUE

``` r
heatmap_missing_by_spaced_repetition
```

![](BIProject-Template_files/figure-gfm/code%20chunk%202-2.png)<!-- -->

``` r
# Are there missing values in the dataset?
any_na(imputed_data)
```

    ## [1] TRUE

``` r
# How many missing values?
n_miss(imputed_data)
```

    ## [1] 5

``` r
# What is the percentage of missing data in the entire dataset?
prop_miss(imputed_data)
```

    ## [1] 0.00450045

``` r
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
```

    ## [1] 5

``` r
# What is the number and percentage of missing values grouped by each variable?
miss_var_summary(predictor_vars)
```

    ## # A tibble: 11 × 3
    ##    variable                  n_miss pct_miss
    ##    <chr>                      <int>    <dbl>
    ##  1 health                         1    0.990
    ##  2 family_relationships           1    0.990
    ##  3 mentor                         1    0.990
    ##  4 night_out                      1    0.990
    ##  5 alcohol_or_narcotics           1    0.990
    ##  6 gender                         0    0    
    ##  7 YOB                            0    0    
    ##  8 spaced_repetition              0    0    
    ##  9 testing_and_active_recall      0    0    
    ## 10 motivator                      0    0    
    ## 11 GRADE                          0    0

``` r
# What is the number and percentage of missing values grouped by each observation?
miss_case_summary(predictor_vars)
```

    ## # A tibble: 101 × 3
    ##     case n_miss pct_miss
    ##    <int>  <int>    <dbl>
    ##  1    88      5     45.5
    ##  2     1      0      0  
    ##  3     2      0      0  
    ##  4     3      0      0  
    ##  5     4      0      0  
    ##  6     5      0      0  
    ##  7     6      0      0  
    ##  8     7      0      0  
    ##  9     8      0      0  
    ## 10     9      0      0  
    ## # ℹ 91 more rows

``` r
# Check if the data types of predictor variables are suitable for Random Forest imputation
sapply(predictor_vars, class)
```

    ##                    gender                       YOB         spaced_repetition 
    ##                  "factor"                    "Date"                  "factor" 
    ## testing_and_active_recall                 motivator                    health 
    ##                  "factor"                  "factor"                  "factor" 
    ##      family_relationships                    mentor                 night_out 
    ##                  "factor"                  "factor"                  "factor" 
    ##      alcohol_or_narcotics                     GRADE 
    ##                  "factor"                  "factor"

``` r
library(readr)
```

# Step 3: Perform multivariate imputation using Random Forest imputation

``` r
# Perform multivariate imputation using Random Forest imputation
# Make sure to adjust num.trees as needed
imputed_data_mice <- mice(predictor_vars, m = 11, seed = 7, method = "rf", num.trees = 100)
```

    ## 
    ##  iter imp variable
    ##   1   1  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   1   2  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   1   3  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   1   4  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   1   5  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   1   6  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   1   7  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   1   8  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   1   9  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   1   10  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   1   11  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   2   1  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   2   2  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   2   3  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   2   4  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   2   5  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   2   6  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   2   7  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   2   8  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   2   9  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   2   10  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   2   11  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   3   1  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   3   2  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   3   3  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   3   4  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   3   5  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   3   6  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   3   7  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   3   8  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   3   9  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   3   10  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   3   11  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   4   1  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   4   2  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   4   3  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   4   4  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   4   5  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   4   6  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   4   7  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   4   8  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   4   9  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   4   10  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   4   11  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   5   1  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   5   2  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   5   3  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   5   4  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   5   5  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   5   6  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   5   7  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   5   8  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   5   9  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   5   10  health  family_relationships  mentor  night_out  alcohol_or_narcotics
    ##   5   11  health  family_relationships  mentor  night_out  alcohol_or_narcotics

``` r
# Visualize the imputed data with strip-plots
stripplot(imputed_data_mice)
```

![](BIProject-Template_files/figure-gfm/code%20chunk%203-1.png)<!-- -->

``` r
# Create a complete data frame from imputed data
imputed_data_complete <- complete(imputed_data_mice)

library(readr)
```

# Step 4. Confirm the “missingness” in the Imputed Dataset

``` r
# A textual confirmation that the dataset has no more missing values in any feature:
miss_var_summary(imputed_data_complete)
```

    ## # A tibble: 11 × 3
    ##    variable                  n_miss pct_miss
    ##    <chr>                      <int>    <dbl>
    ##  1 gender                         0        0
    ##  2 YOB                            0        0
    ##  3 spaced_repetition              0        0
    ##  4 testing_and_active_recall      0        0
    ##  5 motivator                      0        0
    ##  6 health                         0        0
    ##  7 family_relationships           0        0
    ##  8 mentor                         0        0
    ##  9 night_out                      0        0
    ## 10 alcohol_or_narcotics           0        0
    ## 11 GRADE                          0        0

``` r
# A visual confirmation that the dataset has no more missing values in any feature:
Amelia::missmap(imputed_data_complete)
```

![](BIProject-Template_files/figure-gfm/code%20chunk%204-1.png)<!-- -->

``` r
# Are there missing values in the dataset?
any_na(imputed_data_complete)
```

    ## [1] FALSE

``` r
# How many missing values?
n_miss(imputed_data_complete)
```

    ## [1] 0

``` r
# What is the percentage of missing data in the entire dataset?
prop_miss(imputed_data_complete)
```

    ## [1] 0

``` r
# How many missing values does each variable have?
imputed_data_complete %>% is.na() %>% colSums()
```

    ##                    gender                       YOB         spaced_repetition 
    ##                         0                         0                         0 
    ## testing_and_active_recall                 motivator                    health 
    ##                         0                         0                         0 
    ##      family_relationships                    mentor                 night_out 
    ##                         0                         0                         0 
    ##      alcohol_or_narcotics                     GRADE 
    ##                         0                         0

``` r
# What is the number and percentage of missing values grouped by each variable?
miss_var_summary(imputed_data_complete)
```

    ## # A tibble: 11 × 3
    ##    variable                  n_miss pct_miss
    ##    <chr>                      <int>    <dbl>
    ##  1 gender                         0        0
    ##  2 YOB                            0        0
    ##  3 spaced_repetition              0        0
    ##  4 testing_and_active_recall      0        0
    ##  5 motivator                      0        0
    ##  6 health                         0        0
    ##  7 family_relationships           0        0
    ##  8 mentor                         0        0
    ##  9 night_out                      0        0
    ## 10 alcohol_or_narcotics           0        0
    ## 11 GRADE                          0        0

``` r
# What is the number and percentage of missing values grouped by each observation?
miss_case_summary(imputed_data_complete)
```

    ## # A tibble: 101 × 3
    ##     case n_miss pct_miss
    ##    <int>  <int>    <dbl>
    ##  1     1      0        0
    ##  2     2      0        0
    ##  3     3      0        0
    ##  4     4      0        0
    ##  5     5      0        0
    ##  6     6      0        0
    ##  7     7      0        0
    ##  8     8      0        0
    ##  9     9      0        0
    ## 10    10      0        0
    ## # ℹ 91 more rows

``` r
# Which variables contain the most missing values?
gg_miss_var(imputed_data_complete)
```

![](BIProject-Template_files/figure-gfm/code%20chunk%204-2.png)<!-- -->

``` r
# Where are missing values located (the shaded regions in the plot)?
vis_miss(imputed_data_complete) + theme(axis.text.x = element_text(angle = 80))
```

![](BIProject-Template_files/figure-gfm/code%20chunk%204-3.png)<!-- -->

``` r
# Create a heatmap of "missingness" broken down by the 'gender' variable
# Confirm that 'gender' is a categorical variable
is.factor(imputed_data_complete$gender)
```

    ## [1] TRUE

``` r
# Create the visualization
gg_miss_fct(imputed_data_complete, fct = gender)
```

![](BIProject-Template_files/figure-gfm/code%20chunk%204-4.png)<!-- -->

``` r
library(readr)
```
