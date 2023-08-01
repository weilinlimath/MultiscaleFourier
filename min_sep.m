function sep = min_sep(X)

X = sort(mod(X,1));
D1 = dtorus(X, circshift(X,1));
D2 = dtorus(X, circshift(X,-1));
sep = min(min(D1,D2));