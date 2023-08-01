%

m = 100;
L = 2;
beta = 0.1/m:0.1/m:20/m;
exact = zeros(length(beta),1);
myest = 0*exact;
GBest = 0*myest; 

for kk = 1:length(beta)
    C1 = (0:L)/(L*m);
    C2 = C1(end)+(0:2)/(2*m);
    X = [C1, beta(kk)+C2];
    exact(kk) = sigma_min(m,X);
    GBest(kk) = GB_lower_bound(m,X);
    if beta(kk)>=18/m
        tau = beta(kk);
    else
        tau = 1/2;
    end
    myest(kk) = lower_bound(m,X,tau);
end

%%

figure;
semilogy(beta,exact,LineWidth=2)
hold on
semilogy(beta,myest,LineWidth=2)
semilogy(beta,GBest,LineWidth=2)
hold off
xlabel('Separation',Interpreter='latex')
title('Colliding clumps',Interpreter='latex')
legend('Exact value $\sigma_s(\Phi)$','Main theorem','G-B theorem',Interpreter='latex')
set(gca,'FontSize',16)
legend(Location="southeast")
exportgraphics(gca,'colliding_clumps.eps')
