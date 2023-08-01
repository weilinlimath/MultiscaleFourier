function sig = sigma_min(M,X)
% calculates the minimum singular value of the Vandermonde matrix with
% nodes X and m rows

sig = 0*M; 
for kk = 1:length(M)
    m = M(kk);
    Phi = exp(2*pi*1i*(0:(m-1))'*X);
    sig(kk) = min(svd(Phi));
end
