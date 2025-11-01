library("lavaan")
library("tidySEM")
library("lavaan")
library("ggplot2")
library("dplyr")

data <- read.csv("")




new_data <- subset(data, select = c(columns))

new_data <- na.omit(new_data)

#print(new_data)

new_data$x <- as.factor(new_data$x)

#print(varTable(new_data))


#CFA
model <- '
#measurement model
latent_factor_1 =~ post_2.4.1i + post_2.4.1ii + post_2.4.1iii + post_2.4.1iv + post_2.4.1v + post_2.4.1vi
latent_factor_2 =~ pre_3.1.1vi + pre_3.1.1vii + pre_3.1.1viii + pre_3.4.2
latent_factor_3 =~  pre_3.3.2i + pre_3.3.2ii + pre_3.3.2iii + post_2.1.1viii + post_2.1.1ix + post_2.1.1x
'

fit <- cfa(model, data = new_data, std.lv=TRUE)

#print(summary(fit, standardized=TRUE, fit.measures = TRUE))





#SEM model
model <- '
#measurement model
latent_factor_1 =~ post_2.4.1i + post_2.4.1ii + post_2.4.1iii + post_2.4.1iv + post_2.4.1v + post_2.4.1vi
latent_factor_2 =~ pre_3.1.1vi + pre_3.1.1vii + pre_3.1.1viii + pre_3.4.2
latent_factor_3 =~  pre_3.3.2i + pre_3.3.2ii + pre_3.3.2iii + post_2.1.1viii + post_2.1.1ix + post_2.1.1x

#regression model
latent_factor_1 ~ latent_factor_2 + latent_factor_3 

#covariances
latent_factor_3 ~~ latent_factor_2
'





#UNLOCK the Estimate of the latent variables to 1
fit <- sem(model, data = new_data, std.lv=TRUE)

#LOCK the Estimate of the latent variables to 1
#fit <- sem(model, data = new_data, std.lv=FALSE)

print(summary(fit, standardized=TRUE, fit.measures = TRUE))

#print(graph_sem(model = fit))
