function C = set_minus(A,B)

for kk = 1:length(B)
    b = B(kk);
    A = A(A~=b);
end
C = A;