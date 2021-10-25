% DATA 55100: Unsupervised Machine Learning
% Spring 2021 - Assignment 6
% Cluster validity indices
 
% Load the dataset
DataSets = LoadDataSets(); % loads the .PGM datasets from the clustering folder
x1 = DataSets {1};
 
% Cluster via FCM - setting the cluster number
% generating centroids and the membership matrix U
clusterNum = 7;
options = [2, 200, 1e-5, true];
[centers, U] = fcm(x1, clusterNum, options);
 
 
% Partition Coefficient
for i = 1:numel(U)
    sqrU(i) = U(i).^2;
    sumSU = sum(sqrU);
    partitionCoef = sumSU/length(U);
end
 
% Classification Entropy
for i = 1:numel(U)
    logU(i) = U(i)*log(U(i));
    sumLU = sum(logU);
    classEntropy = -(sumLU/length(U));
end
    
 
% CS Index
maxU = max(U);
%i = 1; %index must be positive 
index{i} = [];
% Generate clusters of data
for i = 2:clusterNum
    index{i} = find(U(i,:) == maxU);
end
% Index by clustering space
for i = 2:clusterNum
    num = pdist(index{i}'); %within cluster distance from center
    maxdist = max(num);
    den = pdist(mean(centers)'); %between cluster center distances
    mincenter = min(den);
    n = length(index{i}); %size of each indexed column
    numerator = (1/i)*(sum((1/n)*maxdist));
    denominator = (1/i)*(sum(mincenter));
end
csIndex = numerator/denominator
