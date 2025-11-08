library(ltm)

smartcity <- read.csv(file="")


q3abdef = smartcity$q3a + smartcity$q3b + smartcity$q3d + smartcity$q3e + smartcity$q3f
q7abeh = smartcity$q7a + smartcity$q7b + smartcity$q7e + smartcity$q7h
q7df = smartcity$q7d + smartcity$q7f
q8abcdj = smartcity$q8a + smartcity$q8b + smartcity$q8c + smartcity$q8d + smartcity$q8j
q8fgh = smartcity$q8f + smartcity$q8g + smartcity$q8h
q8ek = smartcity$q8e + smartcity$q8k
q10acd = smartcity$q10a + smartcity$q10c + smartcity$q10d
q13cdef = smartcity$q13c + smartcity$q13d + smartcity$q13e + smartcity$q13f



model <- lm(formula = q5 ~ q2 + q3abdef + q3c + q4 + q6sum + q7abeh + q7df + q7c + q7g + q8abcdj + q8fgh + q8i + q9 + q10acd + q12 + q13cdef, data=smartcity)


print(summary(model))
print(AIC(model))

#Inspect the Akaike Information Criterion for model selection 
aic_backward <- step(model, direction = 'backward', trace = 1)
print(summary(aic_backward))


model_empty <- lm(formula = q5 ~ 1, data = smartcity)
aic_forward <- step(model, direction = "forward", scope = formula(model_empty))
print(summary(aic_forward))

