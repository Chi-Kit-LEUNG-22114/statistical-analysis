library(psych)
library(lavaan)

data <- read.csv("")
data <- na.omit(data)



# composite variables
data$policy12 <- rowMeans(data.frame(data$policy1 , data$policy2), na.rm = TRUE)
data$energy12 <- rowMeans(data.frame(data$energy1 , data$energy2), na.rm = TRUE)
data$energy34 <- rowMeans(data.frame(data$energy3 , data$energy4), na.rm = TRUE)



re_org <- data.frame(data$policy12,data$policy3,data$energy12,data$energy34,data$t_gov_c1,data$t_gov_hk,data$t_com1,data$t_civ1,data$t_civ2,data$t_civ3,data$t_com2,data$t_com3,data$t_cit,data$r_gov_c1,data$r_gov_hk,data$r_com1,data$r_civ1,data$r_civ2,data$r_civ3,data$r_com2,data$r_com3,data$r_cit,data$risk3,data$risk4)





#EFA - #Result indicate 6-7 factors
eigenvalues <- eigen((cor(re_org)))$values
#rint(eigenvalues)


efa_result <- fa(r = re_org, nfactors = 7, rotate = "oblimin", fm = "ml"))

print(efa_result)
