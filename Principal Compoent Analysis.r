

# Set a seed for reproducibility
set.seed(123)

# Create a data frame with 4 features and 100 observations each
combined_data <- data.frame(
  feature1 = rnorm(100, mean = 0, sd = 1),    # Standard normal distribution
  feature2 = rnorm(100, mean = 5, sd = 2),    # Mean = 5, SD = 2
  feature3 = rnorm(100, mean = 3, sd = 1.5), # Mean = -3, SD = 1.5
  feature4 = rnorm(100, mean = 10, sd = 3)    # Mean = 10, SD = 3
)



# Inspect the first few rows of the dataset
print(head(combined_data))




#PRINCOMP() eigenvalue decomposition of the covariance matrix same as SPSS
numerical_data <- combined_data
data_normalized <- scale(numerical_data)
data_pca <- princomp(data_normalized)

print("PRICOMP")
print(summary(data_pca))
print(data_pca$loadings[, 1:3])     #Normalized factor loading, to get the raw factor loading, multiply by the Standard Deviation of the component
print(data_pca$scores) #the PCA scores is the projection of the original data onto the principal components as a coordinate

eigenvalues <- data_pca$sdev^2
print(eigenvalues) #eigenvalues of the covariance matrix of the data







#PRCOMP()  Singular value decomposition (SVD)
data_pca2 <- prcomp(numerical_data, center = TRUE, scale. = TRUE)
print("PRCOMP")
print(summary(data_pca2))
print(data_pca2$rotation[, 1:3]) #loadings of the first three principal components
print(data_pca2$x) #the PCA scores is the projection of the original data onto the principal components as a coordinate
#print(data_pca2$sdev^2) #eigenvalues of the covariance matrix of the data



# Bartlett’s test of sphericity
library(psych)

cor_matrix <- cor(korea)        #Correlation is already standardized the data, unless is covarience
bartlett <- cortest.bartlett(cor_matrix, n=nrow(korea))
print(bartlett)



#KMO
kmo <- KMO(cor(korea))
print(kmo$MSA)
for (row in kmo$MSAi) {
    print(row)
}


"""
The sum of normalized squared loadings for each component is equal to 1, which is the proportion of variance explained by each component when the data is standardized.
The eigenvalues represent the amount of variance explained by each principal component. In this case, the first component explains the most variance, followed by the second, and so on.
The square of the standard deviations (sdev) gives the eigenvalues of the covariance matrix of the data.
The PCA scores are the coordinates of the original data points in the new principal component space. Each row corresponds to an observation, and each column corresponds to a principal component.
The loadings represent the correlation between the original variables and the principal components. Higher absolute values indicate a stronger relationship between the variable and the component.
The Bartlett's test of sphericity tests the hypothesis that the correlation matrix is an identity matrix, which would indicate that the variables are unrelated and unsuitable for structure detection. A significant result (p < 0.05) indicates that there are significant relationships among the variables.
The Kaiser-Meyer-Olkin (KMO) measure of sampling adequacy tests whether the partial correlations among variables are small. Values closer to 1 indicate that a factor analysis may be useful with your data. Values below 0.5 suggest that factor analysis may not be appropriate.
"""
