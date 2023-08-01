function d = dtorus(x,y)
% computes the torus distance between x and y
% either x and y are vectors of the same length or x is a vector and y is a
% scalar

x = x(:);
y = y(:);

x = mod(x,1);
y = mod(y,1);

d = min(min(abs(x-y),abs(x+1-y)),abs(x-1-y));