library(readr)
View(df)
datafile <- read_csv("5- respiratory-infection-death-rate-who-mdb.csv")
df<-datafile
names(df)[1] <- "Entity"
names(df)[1] <- "Country"
names(df)[2] <- "Code"
names(df)[3] <- "year"
names(df)[4] <- "Death"
mean(df$Death)
