function [B,G] = compute_decomp(tau,X,x)

G = X(dtorus(X,x)>tau);
B = X(dtorus(X,x)<=tau);
