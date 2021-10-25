clc;
clear;
close all;

% Pull and create the dataset for iris
[X] = iris_dataset();
X = X';
%y = vec2ind(y)'; % can remove y from pull and here and no effect

% Separate the dataset into the appropriate label groups
X1 = X(1:50, 1:4);
X2 = X(51:100, 1:4);
X3 = X(101:150, 1:4);

% Find the means of each of the classes
mu1 = mean(X1)';
mu2 = mean(X2)';
mu3 = mean(X3)';

% Find the total mean of all classes
mu = mean(X)';

% Find the covariance of the classes
S1 = cov(X1);
S2 = cov(X2);
S3 = cov(X3);

% Find the within class scatter
Sw= S1+S2+S3;
invSw = inv(Sw);

% Find Omega
omega = invSw*(mu1-mu2-mu3);

% Find y - transpose of omega and transpose of X as it is saved as X=X'
y = omega'*X';

% Plot y - 1D representation using LDA
figure(1);
hist(y,150);
xlabel('1D representation using LDA');

figure(2);
plot(y,'or');
xlabel('1D representation using LDA');