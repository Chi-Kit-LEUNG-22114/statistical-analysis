import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans

from sklearn.datasets import make_blobs
from sklearn.metrics import silhouette_score

# Extended example dataset with more categories



df = pd.read_csv("", index_col=0)


# Prepare data for clustering
df = df[["col1", "col2", "col3"]]

X = df



for k in range(2, 5):
    # Initializing KMeans
    kmeans = KMeans(n_clusters=k)

    # Fitting the model
    kmeans.fit(X)

    # Predicting the clusters
    df[f'Cluster_{k}'] = kmeans.predict(X)

df.to_excel(r"")
print("done")





































"""
import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Example dataset
data = np.array([
    [1, 2],
    [2, 3],
    [3, 4],
    [4, 5],
    [5, 6],
    [6, 7],
    [7, 8],
    [8, 9],
    [9, 10],
    [10, 11]
])



# Number of clusters
num_clusters = 3

# Initialize the KMeansClustering model
kmeans = tf.contrib.factorization.KMeansClustering(
    num_clusters=num_clusters, use_mini_batch=False)

def input_fn():
    return tf.constant(data, dtype=tf.float32)

# Train the model
kmeans.train(input_fn, steps=100)

# Predict the clusters
cluster_indices = list(kmeans.predict_cluster_index(input_fn))



# Convert cluster indices to numpy array
cluster_indices = np.array(cluster_indices)

# Plot the data points with cluster assignments
plt.scatter(data[:, 0], data[:, 1], c=cluster_indices, cmap='viridis')
plt.xlabel('X')
plt.ylabel('Y')
plt.title('K-means Clustering with TensorFlow')
plt.show()
"""