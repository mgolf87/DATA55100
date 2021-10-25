clc;
clear;
close all;

% Pull and create the dataset for iris
[X] = iris_dataset();
% transpose so samples are rows and features are columns
X = X';


% Code for PCA:
%
%
% find and create the eigenvalues/vectors from the covariance
% of the iris dataset
[EIGVEC, EIGVAL] = eig(cov(X));

% store PC1 and PC2 innto PCAdim
PCAdim = [];
for i=1:150
    PCAdim(i,1) = X(i,:)*EIGVEC(:,4);
    PCAdim(i,2) = X(i,:)*EIGVEC(:,3);
end


% Code for LDA:
%
%
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

% Find y the feature vector but store as LDAdim
% - transpose of omega and transpose of X as it is saved as X=X'
LDAdim = omega'*X';
LDAdim = LDAdim'; % corrects to samples down instead of across


% Code for BCSA
%
% 
% Prompt for alpha
promptA = 'Please enter an alpha value between 0.1 and 1.0: ';
alpha = input(promptA);
if (alpha > 1) || (alpha < 0.1)
    disp('Please reread instructions')
end

BSCA(LDAdim, alpha, 3)
function clustPlot = BSCA(data, alpha, q)
% BSCA - basic sequential clustering algorithm
%   inputs: the data which has been reduced from LDA or PCA,
%   the threshold of dissimilarity (alpha), and the maximum number of
%   clusters
%   output: the plot of the clusters

N = size(data,1);
%nFeatures = size(data, 2);
labels = zeros(1,N); % zero value indicates an unclustered point
m = 1; % index
labels(1) = 1;
q = 4; % set cluster number to 3 and vary for assignment

%randData = data(randperm(size(data,1)),:); % randomizes the samples in the given data
for i = 2:N
    % find C_k : d(x_i, C_k) = min_{1 <= j <= m} d(x_i, C_j)
    [d_x_i_C_k, k] = closestCluster(i, labels, data); % call the closestCluster function
    if((d_x_i_C_k > alpha) && (m<q)) % dissimilarity and total cluster number conditions
        m = m + 1;
    end
    labels(i) = m;
end

%res = labels;


    function [d_x_i_C_k, k] = closestCluster(i, labels, data)
    % inputs the relative sample and label to output the distance and
    % cluster membership of a sample
    ulab = unique(labels);
    if(ulab(1)==0)
        ulab = ulab(2:end); % remove 0's as we add points to clusters
    end
    assignclust = []; % empty set to add cluster assignments
    for lab = ulab
        indv = find(labels==lab);
        rep = mean(data(indv,:), 1)';
        d = sqrt((data(i,:)'-rep)'*(data(i,:)'-rep)); % distance calculation
        assignclust = [assignclust, d]; % assign to the smallest distance
    end
    [d_x_i_C_k, mind] = min(assignclust);
    k = ulab(mind); % closest cluster
        
    end
%gscatter(data(:,1), data(:,2), labels) %used for PCA as its 2D
plot(labels, 'o') %used for LDA as 1D
end




