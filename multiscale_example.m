% create set
m = 100;
Ep = 0.001:0.01:1;
results = 0*Ep;
myest = 0*Ep;
GBest = 0*Ep;

% compute sigma_s and theorem 
for kk = 1:length(Ep)
    ep = Ep(kk); 
    X1 = ep*(0:3)/90; 
    X2 = 1/3+ep*(0:2)/200;
    X3 = 2/3+ep*(0:1)/500;
    X = [X1, X2, X3];
    results(kk) = sigma_min(m,X);
    tau = 1/4;
    myest(kk) = lower_bound(m,X,tau);
    GBest(kk) = GB_lower_bound(m,X);
end


% plot results 
figure; 
loglog(Ep,results,LineWidth=2)
hold on
loglog(Ep,myest,LineWidth=2)
loglog(Ep,GBest,LineWidth=2)
hold off
xlabel('$\varepsilon$',Interpreter='latex')
title('Multiscale example',Interpreter='latex')
legend('Exact value $\sigma_s(\Phi)$','Main theorem','G-B theorem',Interpreter='latex')
legend(Location="northwest")
set(gca,'FontSize',16)
exportgraphics(gca,'multiscale1.eps')
