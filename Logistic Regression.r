library(marginaleffects)

ata <- read.csv(file = "")


#Logistic
regression <- glm( y_n ~ attendence, data = ata, family ="binomial")

print(summary(regression))


#The Margineal Effects AME
result <- avg_comparisons(regression)
print((result))


#AME when x is at the given value, the printed estimate is the percentage increase if x increase at one unit when x is equal 5
result <- avg_comparisons(regression, newdata = datagrid(attendence = c(5)))


#Prediction for double check
df <- data.frame(attendence = c(5,6))


#Calculate the P(Y=1 | x), the probability of being yes (Y=1). With newdata = 5, the probability is P(Y=1|x=5) 
prediction <- avg_predictions(regression, newdata = datagrid(attendence = c(2)))

#print(prediction)