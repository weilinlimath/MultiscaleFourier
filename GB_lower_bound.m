function est = GB_lower_bound(m,X)

s = length(X);
Z = exp(2*pi*1i*X);
P = 0*X;

for kk = 1:s 
    S = Z([1:kk-1,kk+1:end]);
    P(kk) = prod(2./abs(S-Z(kk)));
end

C = sqrt(s/floor(m/s));
est = 1/(C*max(P)); 