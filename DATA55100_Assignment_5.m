% DATA 55100: Unsupervised Machine Learning
% Spring 2021 - Assignment 5
% Fuzzy C-means (FCM) algorithm

% Load the datasets
DataSets = LoadDataSets(); % loads the .PGM datasets from the clustering folder

% Store the distributions % where i indicates the # for the number of the dataset in the folder
x1 = DataSets {1};


% Plot the distributions for investigation
plot(x1(:,1), x1(:,2), 'or');

% Cluster via FCM - setting the cluster number
% generating centroids and the membership matrix U
% add in options function for changing Q (fuzzifier)
options = [2 NaN NaN 0]; % 2 is default
[centers, U] = fcm(x1,7,options);
%[centers, U] = fcm(x1,4);

% Classify data points into the cluster with the largest membership value
maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);
index3 = find(U(3,:) == maxU);
index4 = find(U(4,:) == maxU);
index5 = find(U(5,:) == maxU);
index6 = find(U(6,:) == maxU);
index7 = find(U(7,:) == maxU);


% Plot the clustered data and the cluster centers
plot(x1(index1,1),x1(index1,2),'bo')
hold on
plot(x1(index2,1),x1(index2,2),'go')
hold on
plot(x1(index3,1),x1(index3,2),'ro')
hold on
plot(x1(index4,1),x1(index4,2),'yo')
hold on
plot(x1(index5,1),x1(index5,2),'co')
hold on
plot(x1(index6,1),x1(index6,2),'ko')
hold on
plot(x1(index7,1),x1(index7,2),'mo')
% Plot the centroids
plot(centers(1,1),centers(1,2),'bx','MarkerSize',15,'LineWidth',3)
plot(centers(2,1),centers(2,2),'gx','MarkerSize',15,'LineWidth',3)
plot(centers(3,1),centers(3,2),'rx','MarkerSize',15,'LineWidth',3)
plot(centers(4,1),centers(4,2),'yx','MarkerSize',15,'LineWidth',3)
plot(centers(5,1),centers(5,2),'cx','MarkerSize',15,'LineWidth',3)
plot(centers(6,1),centers(6,2),'kx','MarkerSize',15,'LineWidth',3)
plot(centers(7,1),centers(7,2),'mx','MarkerSize',15,'LineWidth',3)
hold off