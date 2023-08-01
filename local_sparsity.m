function nu = local_sparsity(tau,X)

s = length(X);
nu = 0*X;
for kk = 1:s
    nu(kk) = length(X(dtorus(X,X(kk))<=tau));
end
nu = max(nu);
if isempty(nu)
    nu = 0;
end