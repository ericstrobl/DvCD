function K = KernelType(dot,kernel_type,sig)
if strcmp(kernel_type,'rbf')
    if isempty(sig),
    	sig = DetermineSig(dot);
    end
    K = rbf(dot,sig);
elseif strcmp(kernel_type,'lin')
    K = dot;
end
end
