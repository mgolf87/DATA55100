clc;
clear;
close all;

% Pull and create the dataset for iris
[X, y] = iris_dataset();
X = X';
y = vec2ind(y)'; % can remove y from pull and here and no effect

% find and create the eigenvalues/vectors from the covariance
% of the iris dataset
[EIGVEC EIGVAL] = eig(cov(X));

% plot the largest eigenvalue/vector in 1D = Histogram
XT = [];
for i=1:150
    XT(i,1) = X(i,:)*EIGVEC(:,4); %largest EIGVAL is 4
end
figure(1);
hist(XT,150);
xlabel('PC1');

% plot the two largest eigenvalue/vectors in 2D = Scatterplot
XT = [];
for i=1:150
    XT(i,1) = X(i,:)*EIGVEC(:,4);
    XT(i,2) = X(i,:)*EIGVEC(:,3);
end
figure(2);
plot(XT(:,1),XT(:,2),'o');
xlabel('PC1'); ylabel('PC2');

% plot the three largest eigenvalue/vectors in 3D = Scatterplot
XT = [];
for i=1:150
    XT(i,1) = X(i,:)*EIGVEC(:,4);
    XT(i,2) = X(i,:)*EIGVEC(:,3);
    XT(i,3) = X(i,:)*EIGVEC(:,2);
end
figure(3);
plot3(XT(:,1),XT(:,2),XT(:,3),'or');
xlabel('PC1'); ylabel('PC2'); zlabel('PC3');