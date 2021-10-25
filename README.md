# DATA55100 - Unsupervised Machine Learning
Lewis University Spring 2, 2021

<br />

### Week 2 Assignment - Dimensionality Reduction: 
#### DATA55100_PCA.m; DATA55100_LDA.m
Principal Components Analysis (PCA) and Linear Discriminate Analysis (LDA) are both linear transformation techniques used for dimensionality reduction in order to transform the data into a new space which maximizes the variance (PCA) or the class separation (LDA). PCA in particular, is an unsupervised linear transformation method which is used to reduce the dimension number from high dimensional data into lower dimensions by selecting the ‘principal components’ which are used as the new eigenvector axes in the direction of the most variance to maximize the variance or information contained within the data. LDA on the other hand, is a supervised linear transformation method which uses class labels and a mean eigenvector instead of variance to select new axes for reducing the dimensionality based on maximizing class separation. Generally speaking, the first principal component – variance or mean vector, carries the most information and this trend continues down the axes numbers, meaning that when we discard principal components to decrease the dimensions we start with those that contain the least amount of information. PCA looks for the eigenvectors which best describe the information within the data. LDA on the other hand discriminates between classes and the data represents maximizing the between-class measure and minimizing the within-class measure.

<br />

### Week 3 Assignment - Clustering: 
#### DATA55100_Assignment_3.m
Clustering data reduced by PCA to 2-Dimensions (2D) and the same data reduced by LDA to 1-Dimension (1D), using the Basic Sequential Clustering Algorithm (BSCA). When implementing BSCA, clusters are defined by a distance measure of the point from a cluster. This measure can be represented as the Manhattan distance for example, however we will be using the Euclidean distance which takes the square root of the square of y2-y1 plus the square of x2-x1. For our 2D clustering using the resultant PCA-reduced data we will use both terms, whereas for the 1D resultant LDA-reduced data the y-term will become zero. Membership of cluster belongs to the data points which are at a minimum distance from the cluster. As well, clusters will be updated as they grow, summing the points and dividing by the total number of points to produce a mean value, which can be compared to points in order to determine distance and therefore membership. Initially, we set an index value of 1 which will be incremented as we create new clusters. This index value is compared to a predefined cluster number and if the cluster number is not greater than the index then we will not create any new clusters, and the sample being evaluated will be added to a previously existing cluster. Another parameter that we must consider for BSCA is the α value, which is a threshold generally between 0.1 and 1.0. When considering the distance of a point from a cluster we compare the distance with this α value, if the distance is greater than the α value and as we mentioned if the index value is less than the cluster number then we create a new cluster using this point. However, if either of these conditions is not met then we combine the data point into an already existing cluster and update its mean point for future distance comparisons. These are the basics of the BSCA algorithm, the key features of this algorithm are the user defined parameters which are the α value or the threshold of dissimilarity and the maximum number of clusters allowed. As with most clustering techniques noise will throw off the clustering algorithm and may result in inconclusive clustering that misses the underlying structure of the data. Therefore, techniques like the Visual Assessment of Clustering Tendency algorithm is an important tool we can use before clustering to ensure that our data is actually possible to be clustered.

<br />

### Week 4 Assignment - Pre-Clustering: 
#### iVAT.m; VAT.m; pdist2.m; LoadDataSets.m
##### (requires datasets.zip)
Firstly, during the pre-clustering stage we want to assess the substructure of the data evaluating whether there’s an inherent tendency to cluster. We can think of clustering tendency as the potentiality of the data to be clustered, and generally non-random data which may carry patterns can be clustered, whereas random data cannot be clustered. The Visual Assessment of Clustering Tendency (VAT) algorithm functions to produce a dissimilarity matrix of pairwise distances between data points (via pdist2 function). This dissimilarity matrix is then reorganized into an ordered dissimilarity matrix with similar objects close together (clusters). An intensity image is then created from this ordered dissimilarity matrix where 0 intensity is represented by black checkers and 1 intensity is represented by white checkers. VAT takes checkered intensity images and transforms them into ordered intensity images where clusters are observed as squares of similar intensities. Other methods also exist which can be performed during the pre-clustering stage. As we discussed, the VAT algorithm creates a matrix of the distance distributions calculated from pairwise distances between data points, orders it, and then transforms it into an intensity image, iVAT functions the same except that it scales the intensity to produce clearer boundaries that are easier to read. Another alternative method is to plot a spatial histogram of the data points to visually highlight any inherent clusters compared against a histogram of a randomly generated distribution. The Hopkins statistics is another method for evaluating the cluster-ability of the data by sampling the dataset via probability for clusters and evaluating the difference in points between the original and the sampled dataset. Having a Hopkins statistic close to 0 indicates a high clustering potential and having a Hopkins statistic close to 1 indicates randomly distributed data.

<br />

### Week 5 Assignment - Pre-Clustering: 
#### DATA55100_PCA.m; DATA55100_LDA.m
Principal Components Analysis (PCA)

<br />

### Week 6 Assignment - Pre-Clustering: 
#### DATA55100_PCA.m; DATA55100_LDA.m
Principal Components Analysis (PCA)

<br />

### Week 7 Assignment - Pre-Clustering: 
#### DATA55100_PCA.m; DATA55100_LDA.m
Principal Components Analysis (PCA)

<br />
