function DD = pdist2(A,B,Wts)
% Find pair-wise SQUARE EUCLIDEAN distance
% or 'Weighted square euclidean' distance
% between each point in A and B
% For 2 vector a, b
% Euclidean distance= d = sum((a-b).^2)
% Weighted version  = d = sum(wts.*(a-b).^2)
% ------------------------------
% Input:
%   A= m_by_p, m points in p-dimension
%   B= n_by_p, n points in p-dimension
%   Wts = 1_by_p, defaut = [1 1 ...]
% Results:
%   DD= m_by_n
% ------------------------------
% Facts: (a-b)^2= a^2+b^2-2ab
% ------------------------------
% trungd@okstate.edu, Feb 2011
% ------------------------------
% Ideal from: Piotr Dollar.  [pdollar-at-caltech.edu]

[m,p1] = size(A); [n,p2] = size(B);
if(p1~=p2) % check size
    error('Must have: ncol(X)=ncol(Y)=length(Wts)')
end
if nargin < 3 % standard euclidean
    AA = sum(A.*A,2);  % column m_by_1
    BB = sum(B.*B,2)'; % row 1_by_n
    DD = AA(:,ones(1,n)) + BB(ones(1,m),:) - 2*A*B';
else
    if p1 ~=length(Wts)
        error('Must have: ncol(X)=ncol(Y)=length(Wts)')
    end
    sW = sqrt(Wts(:)'); % make sure row, square of Wts
    A = sW(ones(1,m),:).*A;
    B = sW(ones(1,n),:).*B; % modify A,B
    % Process the same as standard Euclidean
    AA = sum(A.*A,2);  % column m_by_1
    BB = sum(B.*B,2)'; % row 1_by_n
    DD = AA(:,ones(1,n)) + BB(ones(1,m),:) - 2*A*B';    
end