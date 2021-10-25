function [RiV,RV]=iVAT(R,VATflag);
% Example function call: [RiV] = iVAT(RV);
%
% *** Input Parameters ***
% @param R (n*n double): dissimilarity data input
% @param VATflag (boolean): TRUE - R is VAT-reordered
%
% *** Output Values ***
% @value RV (n*n double): VAT-reordered dissimilarity data
% @value RiV (n*n double): iVAT-transformed dissimilarity data

if(nargin==1)
    VATflag = 0;
end;

N=length(R);

if(VATflag),
    RV=R;
    RiV=zeros(N);
    for r=2:N,
        c=1:r-1;
        [y i]=min(RV(r,1:r-1));
        RiV(r,c)=y;
        cnei=c(c~=i);
        RiV(r,cnei)=max([RiV(r,cnei); RiV(i,cnei)]);
        RiV(c,r)=RiV(r,c)';
    end;
else
    [RV,C]=VAT(R);
    RiV=zeros(N);
    for r=2:N,
        c=1:r-1;
        RiV(r,c)=RV(r,C(r));
        cnei=c(c~=C(r));
        RiV(r,cnei)=max([RiV(r,cnei); RiV(C(r),cnei)]);
        RiV(c,r)=RiV(r,c)';
    end;
end;