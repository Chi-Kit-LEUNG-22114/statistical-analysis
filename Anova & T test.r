pre_data <- read.csv(file="") 

post_data <- read.csv(file="")







# subset the data to only include the first 10 rows
fp_pre <- subset(pre_data, pre_data$district=="FP")
fp_post <- subset(post_data, post_data$district=="FP")

sk_pre <- subset(pre_data, pre_data$district=="SK")
sk_post <- subset(post_data, post_data$district=="SK")

ss_pre <- subset(pre_data, pre_data$district=="SS")
ss_post <- subset(post_data, post_data$district=="SS")

sh_pre <- subset(pre_data, pre_data$district=="SH")
sh_post <- subset(post_data, post_data$district=="SH")



#Successful example 1
anova <- aov(method_1_pre ~ district, data = pre_data)
print(summary(anova))


#Successful example 2
anova <- aov(method_1_pre ~ as.factor(district), data = pre_data)
print(summary(anova))


#Successful example 3
new_df <- data.frame(
  data = c(fp_pre$method_1_pre, sk_pre$method_1_pre, ss_pre$method_1_pre, sh_pre$method_1_pre),
  district = factor(c(
    rep("FP", length(fp_pre$method_1_pre)),
    rep("SK", length(sk_pre$method_1_pre)),
    rep("SS", length(ss_pre$method_1_pre)),
    rep("SH", length(sh_pre$method_1_pre))
  ))
)
anova <- aov(data ~ district, data = new_df)
print(summary(anova))

#Tukey HSD
hsd_result <- TukeyHSD(anova)
print(hsd_result)




#T test for loop
pre_loop <- list(fp_pre, sk_pre, ss_pre, sh_pre)
post_loop <- list( fp_post , sk_post , ss_post, sh_post)


for (i in seq_along(post_loop)) {
  post_data <- post_loop[[i]]
  
  #Perform the t-test
  result <- t.test(sh_post$method_3_post, post_data$method_3_post, alternative = "two.sided", var.equal = FALSE)
  
  #Print the result
  #print(result)
  
  
  #Print the district name
  #print(paste("District:", post_data$district[1]))


}
