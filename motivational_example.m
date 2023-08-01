% create set
X1 = (0:3)/90; 
X2 = 1/3+(0:2)/200;
X3 = 2/3+(0:1)/500;
X = [X1, X2, X3];
s = length(X);

% compute exact sigma_s
delta = min_sep(X);
M = s:(1.2/delta);
results = sigma_min(M,X);

% compute the G-B bound
GBest = 0*M;
for kk = 1:length(M)
    m = M(kk);
    GBest(kk) = GB_lower_bound(m,X);
end

% compute main theorem's bound
Mnew = M(M>=6*s);
myest = 0*Mnew; 

for kk = 1:length(Mnew)
    m = Mnew(kk);
    if m > 600
        tau = 1/100;
    elseif m > 450
        tau = 2/30;
    elseif m > 50
        tau = 3/10;
    else 
        tau = 1/2;
    end
    myest(kk) = lower_bound(m,X,tau);
end

% plot local sparsity as function of tau
tau = linspace(0,1/2,100);
nu = 0*tau; 
for kk = 1:length(tau)
    nu(kk) = local_sparsity(tau(kk),X);
end

% plot local sparsity
figure; 
plot(tau,nu,LineWidth=2)
xlabel('Parameter $\tau$',Interpreter='latex')
title('Local sparsity as a function of $\tau$',Interpreter='latex')
set(gca,'FontSize',16)
exportgraphics(gca,'increasingM1.eps')

% plot X
figure; 
stem(X,ones(length(X),1),LineWidth=2)
axis([0,1,0,1])
set(gca,'FontSize',16,'YTickLabel',[],'XTickLabel',[])
set(gca,'Visible','off')
exportgraphics(gca,'Xmotivational.eps')


% plot all lower bounds 
figure; 
loglog(M,results,LineWidth=2)
hold on 
loglog(Mnew,myest,LineWidth=2)
loglog(M,GBest,LineWidth=2)
hold off
xlabel('Number of rows $m$',Interpreter='latex')
title('Multiscale example',Interpreter='latex')
legend('Exact value $\sigma_s(\Phi)$','Main theorem','G-B theorem',Interpreter='latex')
legend(Location="northwest")
set(gca,'FontSize',16)
exportgraphics(gca,'increasingM2.eps')
