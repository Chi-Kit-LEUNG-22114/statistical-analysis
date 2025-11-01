data <- read.csv(file="")

q1ab = rowMeans(data.frame(data$q1a, data$q1b),na.rm=TRUE)
q3abdef = rowMeans(data.frame(data$q3a, data$q3b, data$q3d, data$q3e, data$q3f),na.rm=TRUE)
q7abeh = rowMeans(data.frame(data$q7a, data$q7b, data$q7e, data$q7h),na.rm=TRUE)
q7df = rowMeans(data.frame(data$q7d, data$q7f),na.rm=TRUE)
q8abcdj = rowMeans(data.frame(data$q8a, data$q8b, data$q8c, data$q8d, data$q8j),na.rm=TRUE)
q8fgh = rowMeans(data.frame(data$q8f, data$q8g, data$q8h),na.rm=TRUE)
q10acd = rowMeans(data.frame(data$q10a, data$q10c, data$q10d),na.rm=TRUE)
q13abcdef = rowMeans(data.frame(data$q13c, data$q13d, data$q13e, data$q13f),na.rm=TRUE)
q4910acd = rowMeans(data.frame(data$q4, data$q9, data$q10a, data$q10c, data$q10d), na.rm=TRUE)
q6sum = rowMeans(data.frame(data$q6a, data$q6b , data$q6c , data$q6d , data$q6e , data$q6f), na.rm=TRUE)







iv_df <- data.frame( 
    data$SurveyCaseid,
    data$q5,
    q1ab,
    data$q2,
    q3abdef,
    data$q3c, 
    q4910acd,
    q6sum,
    q7abeh,
    q7df, 
    data$q7c, 
    data$q7g,
    q8abcdj,
    q8fgh,
    data$q8i,
    data$q12,
    q13abcdef
)

iv <- na.omit(iv_df)



#result <- cor(iv)
#print(result)










iv_list <- list(    
    iv$data.q5,
    iv$q1ab,
    iv$data.q2,
    iv$q3abdef,
    iv$data.q3c, 
    iv$q4910acd,
    iv$q6sum,
    iv$q7abeh,
    iv$q7df, 
    iv$data.q7c, 
    iv$data.q7g,
    iv$q8abcdj,
    iv$q8fgh,
    iv$data.q8i,
    iv$data.q12,
    iv$q13abcdef
)



for (x in iv_list) {

    
    pvalue <- cor.test(iv$data.q5, x, method="pearson", alternative="two.sided")
    print((pvalue))
     
    
}
