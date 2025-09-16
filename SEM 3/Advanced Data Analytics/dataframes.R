library(dplyr)
cm_df <- read.csv("C:/Users/SurajkumarYadav/OneDrive - fugetron corp/Desktop/MSC_DSAI/SEM 3/Advanced Data Analytics/DATA/Churn_Modelling.csv")
View(cm_df)


View(cm_df %>% select(1,2))

cm_df %>% select(starts_with("S")) -> sws
View(sws)

cm_df %>% filter(CreditScore > 700 & Surname == 'Tyler') %>% select("CreditScore", "Surname")  -> credit_score
View(credit_score)