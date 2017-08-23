titanic_original <- read_csv("C:/Users/tcournoyer/Desktop/titanic_original.csv")

titanic_original$embarked[is.na(titanic_original$embarked)] <- "S"
titanic_original$age[is.na(titanic_original$age)] <- round(mean.default(titanic_original$age, na.rm = TRUE),0)
titanic_original$boat[is.na(titanic_original$boat)] <- "None"
View(titanic_original)titanic_original$has_cabin_number <- 1
titanic_original$has_cabin_number[is.na(titanic_original$cabin)] <- 0
