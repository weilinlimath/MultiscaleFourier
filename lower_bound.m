function est = lower_bound(m,X,tau)
% X corresponds to the nodes of the Fourier matrix
% n is natural number
% tau satisfies density criteria

T = 0*X;

for kk = 1:length(X)
    x = X(kk);
    [B,G] = compute_decomp(tau,X,x);
    nuG = local_sparsity(tau,G);
    alpha = length(B)/(2*m-4*nuG/tau);

    Xalpha = X(dtorus(X,x)<=alpha);

    Xtau = set_minus(B,Xalpha);
    prodtau = prod(phi_round(1./(2*dtorus(Xtau,x))));

    Xalpha = set_minus(Xalpha,x);
    prodalpha = prod(alpha./(dtorus(Xalpha,x)*(1-2*alpha)));

    T(kk) = 2^nuG * (2*alpha/(1-2*alpha)) * prodtau^2 * prodalpha^2;

end

est = 1./sqrt(sum(T));
