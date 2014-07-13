function [Ranked,KCDM] = ExcCD(x,tar,kernel_type,task_type,eta)
% Inputs:
% (1) x = data matrix, where rows are instances and columns are features
% (2) TarIndx = column index of the target
% (3) kernel_type = 'lin' for linear kernel, 'rbf' for rbf kernel
% (4) task_type = 'class' for classification, 'reg' for regression
% (5) eta = inverse regularization value
%
% Outputs:
% (1) Ranked = ranking of features in ascending order (least to most likely
%     in Markov blanket)
% (2) KCDM = kernel-based conditional dependence measure when each feature
%     is eliminated. A larger value favors a feature.
%

SetDefaultValue(3,'kernel_type','rbf');
SetDefaultValue(4,'task_type','reg');
SetDefaultValue(5,'eta',1E-4);

[r,c] = size(x);
xindices = 1:c;
xindices(tar) = [];
y = x(:,tar);
x(:,tar) = [];
x = zscore(x);

if strcmp(task_type, 'class')
    Ky = kronDel(y);
elseif strcmp(task_type, 'reg')
    doty = y*y';
    Ky = KernelType(doty,kernel_type,[]);
end
Q=eye(r)-1/r;
Ky = Q*(Ky)*Q;

dotxA = x*x';
sigxA = DetermineSig(dotxA);
KCDM = zeros(1,length(xindices));
for t=1:c-1,
    if mod(t,20)==0 || t==c-1,
        fprintf_r('Kernels computed: %i', t);
    end
    dotx = x(:,t)*x(:,t)';
    dotx = dotxA-dotx;
    Kx = KernelType(dotx,kernel_type,sigxA);
    Kx = Q*(Kx)*Q+r*eta*eye(r);
    KCDM(t) = trace(Ky/Kx);
end
fprintf_r('reset');
fprintf('\n')

[~,idx] = sort(KCDM);
Ranked = xindices(idx);
end
