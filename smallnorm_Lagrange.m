% reproduces the small norm Lagrange interpolants figure in the paper

ep = 1/300; 
zero1 = 1/4 + (0:2)*ep; 
zero2 = 1/2 + (0:1)*ep;
zero3 = 3/4 + (0:3)*ep; 

X = {};
X{1} = [zero1(1),zero2(1),zero3(1)];
X{2} = [zero1(2),zero2(2),zero3(2)];
X{3} = [zero1(3),zero3(3)];
X{4} = [zero3(4)];
nu = length(X); 

m = 10;
fhat = zeros(m,nu);

for kk = 1:nu
    fhat(:,kk) = min_norm_interpolant(m,[0,X{kk}],[1,zeros(1,length(X{kk}))]);
end

mesh = linspace(0,1,100/ep); mesh = mesh(:);
f = zeros(length(mesh),nu);
for kk = 0:(m-1)
    f = f+exp(2*pi*1i*kk*mesh)*fhat(kk+1,:);
end

%%

figure;
hold on
plot(mesh,real(f),LineWidth=2)
stem([zero1,zero2,zero3], zeros(1,9),'filled',Color='k')
hold off
title('Real part of $f_1,f_2,f_3,f_4$',Interpreter='latex')
set(gca,'FontSize',16)
exportgraphics(gca,'smallnormL1.eps')


ind = (mesh > zero3(1)-3*ep) & (mesh < zero3(end)+3*ep);
figure; 
hold on
plot(mesh(ind),real(f(ind,:)),LineWidth=2) 
stem(zero3, zeros(1,4),'filled',Color='k')
hold off
title('Real part of $f_1,f_2,f_3,f_4$',Interpreter='latex')
set(gca,'FontSize',16)
legend('$f_1$','$f_2$','$f_3$','$f_4$',Interpreter='latex')
legend(Location="southwest")
exportgraphics(gca,'smallnormL2.eps')

