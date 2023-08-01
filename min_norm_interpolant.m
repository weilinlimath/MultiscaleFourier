function fhat = min_norm_interpolant(m,X,y)

Phi = exp(-2*pi*1i*(0:(m-1))'*X);
y = y(:);
fhat = lsqminnorm(Phi',y);
