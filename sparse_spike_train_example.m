% create set
m = 200;
S = 5:30;
Ep = [0.1,0.3,0.5];

% compute sigma_s and theorem estimate
exact = zeros(length(S),length(Ep));
pred = 0*exact;
for jj = 1:length(Ep)
    ep = Ep(jj);
    for kk = 1:length(S)
        s = S(kk);
        X = (0:s-1)*(1-ep)/m;
        exact(kk,jj) = sigma_min(m,X);
        pred(kk,jj) = lower_bound(m,X,1/2);
    end
end

% plot results

figure;
colors = get(gca,'colororder');
close all

%%
figure;
semilogy(S,exact(:,1),LineWidth=2)
hold on 
for jj = 2:length(Ep)
    semilogy(S,exact(:,jj)',LineWidth=2)
end

hold on 
for jj = 1:length(Ep)
    semilogy(S,pred(:,jj),LineWidth=2,Color=colors(jj,:),LineStyle='-.')
end
hold off
hold off
xlabel('$s$',Interpreter='latex')
legend('$\varepsilon=0.1$','$\varepsilon=0.3$','$\varepsilon=0.5$',Interpreter='latex')
title('Sparse spike train',Interpreter='latex')
legend(Location="southwest")
set(gca,'FontSize',16)
exportgraphics(gca,'spiketrain.eps')

% plot local sparsity as function of tau
tau = linspace(0,1/2,100);
nu = 0*tau; 
for kk = 1:length(tau)
    nu(kk) = local_sparsity(tau(kk),X);
end
figure; 
plot(tau,nu,LineWidth=2)
xlabel('Parameter $\tau$',Interpreter='latex')
title('Local sparsity as a function of $\tau$',Interpreter='latex')
set(gca,'FontSize',16)
exportgraphics(gca,'spiketrain2.eps')

