function data = CreateArtificialMB(nPts,nEx)
% Inputs
% (1) nPts = number of sample points
% (2) nEx = number of extraneous variables
%
% Outputs
% (1) data = samples in rows, variables in columns. Variables 1,2,3,5,6,7 
%     are in the Markov blanket of 4. Others are not in the Markov blanket.
%

scale = 1;
nNoise = 0;
x = randn(nPts,2);
first = zeros(2,3);
first(:,2) = 1.*ones(2,1);
second = 1.*ones(3,2);
second(1,2) = 0;
second(3,1) = 0;
Layer1 = x+scale*randn(nPts,2);
Layer2 = Layer1*first+scale*randn(nPts,3);
Layer3 = Layer2*second+scale*randn(nPts,2);
Data = [Layer1 Layer2 Layer3];
[r,c] = size(Data);
data = [Data+nNoise.*randn(r,c), randn(r,nEx)+nNoise.*randn(r,nEx)];
