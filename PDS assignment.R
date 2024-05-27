library(ggplot2)
patients1 = read.csv("patientsPG1.csv")
patients2 = read.csv("patientsPG2.csv")
names(patients1)
names(patients2)

patients = rbind(patients1,patients2)
head(patients)

conditions1 = read.csv("ConditionsPG1.csv")
conditions2 = read.csv("ConditionsPG2.csv")

conditions = rbind(conditions1,conditions2)


both = subset(conditions, DESCRIPTION %in% c("Suspected COVID-19","COVID-19"), drop = TRUE)

barplot(table(both$DESCRIPTION),ylim = c(0,9000),col = "skyblue")
table(both$DESCRIPTION)

county = subset(patients, select = c("Id","COUNTY"))
des = subset(both, select = c("PATIENT","DESCRIPTION"))

head(county)
head(des)

merged = merge(county,des, by.x = "Id",by.y = "PATIENT", all = FALSE)

final = subset(merged, select = c("COUNTY","DESCRIPTION"))

cont_t = table(final)
cont_t

barplot(cont_t,beside = TRUE,col = 1:20)

hist(cont_t)

age = subset(patients, select = c("Id","BIRTHDATE"))
head(age)




