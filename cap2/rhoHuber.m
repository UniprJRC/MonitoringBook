%% Details of Huber link for different values of c.
%
% This file creates Figures 2.5 and 2.6.

%% Plot Huber rho function. Figure 2.5
close all
prin=0;
x=-3:0.001:3;
c=1.345;
rhoHU=HUrho(x,c);
plot(x,rhoHU,'LineStyle','-','LineWidth',2)
fs=16;
xlabel('$u$','Interpreter','Latex','FontSize',fs)
ylabel('$\rho (u,1.345)$','Interpreter','Latex','FontSize',fs)
yc=0.13;
text(-c,yc,'$-c=$-1.345','HorizontalAlignment','right','FontSize',fs,'Interpreter','latex')
text(c,yc,'$c=$1.345','FontSize',fs,'Interpreter','latex')
hold('on')
plot(x,x.^2/2,'LineStyle',':','LineWidth',1.5)
stem(c,c^2/2)
stem(-c,c^2/2)
legend(["Huber $\rho$ function" "$u^2/2$"], ...
    'Interpreter','latex','FontSize',16,'Location','best')

if prin==1
    % print to postscript
    print -depsc rhoHU.eps;
else
    title('Figure 2.5')
    set(gcf,"Name",'Figure 2.5')
end

%% Plot of Huber rho function for two values of c - Fig. 2.6.
figure
x=-3:0.001:3;
yc=0.1;
lwd=3;
subplot(2,2,1)
hold('on')
c=0.5;
dx=0.2; % horizontal label displacement
rhoHU=HUrho(x,c);
plot(x,rhoHU,'LineWidth',lwd)
xlabel('$u$','Interpreter','Latex','FontSize',fs)
ylabel(['$\rho (x,' num2str(c) ')$'],'Interpreter','Latex','FontSize',fs)
text(-c-dx,yc,['-$c$=-' num2str(c)],'HorizontalAlignment','right','FontSize',fs,'Interpreter','latex')
text(c+dx,yc,['$c$=' num2str(c)],'HorizontalAlignment','left','FontSize',fs,'Interpreter','latex')
stem(c,c^2/2,'LineStyle',':','LineWidth',2,'Color','r')
stem(-c,c^2/2,'LineStyle',':','LineWidth',2,'Color','r')
xlim([x(1) x(end)])
% psi function
subplot(2,2,3)
hold('on')
psiHU=HUpsi(x,c);
plot(x,psiHU,'LineWidth',2)
xlabel('$u$','Interpreter','Latex','FontSize',fs)
ylabel(['$\psi (x,' num2str(c) ')$'],'Interpreter','Latex','FontSize',fs)
text(-c,yc,['-$c$=-' num2str(c)],'HorizontalAlignment','right','FontSize',fs,'Interpreter','latex')
text(c+dx,yc,['$c$=' num2str(c)],'HorizontalAlignment','left','FontSize',fs,'Interpreter','latex')
hold('on')
stem(c,c,'LineStyle',':','LineWidth',2,'Color','r')
stem(-c,-c,'LineStyle',':','LineWidth',2,'Color','r')
xlim([x(1) x(end)])



subplot(2,2,2)
hold('on')
c=2;
yc=0.3;
lwd=2;
rhoHU=HUrho(x,c);
plot(x,rhoHU,'LineWidth',lwd)
xlabel('$u$','Interpreter','Latex','FontSize',fs)
ylabel(['$\rho (x,' num2str(c) ')$'],'Interpreter','Latex','FontSize',fs)
text(-c,yc,['-$c$=-' num2str(c)],'HorizontalAlignment','right','FontSize',fs,'Interpreter','latex')
text(c+dx,yc,['$c$=' num2str(c)],'HorizontalAlignment','left','FontSize',fs,'Interpreter','latex')
stem(c,c^2/2,'LineStyle',':','LineWidth',lwd,'Color','r')
stem(-c,c^2/2,'LineStyle',':','LineWidth',lwd,'Color','r')
xlim([x(1) x(end)])

subplot(2,2,4)
hold('on')
psiHU=HUpsi(x,c);
plot(x,psiHU,'LineWidth',2)
xlabel('$u$','Interpreter','Latex','FontSize',fs)
ylabel(['$\psi (x,' num2str(c) ')$'],'Interpreter','Latex','FontSize',fs)
text(-c+3*dx,yc,['$-c$=-' num2str(c)],'HorizontalAlignment','right','FontSize',fs,'Interpreter','latex')
text(c+dx,yc,['$c$=' num2str(c)],'HorizontalAlignment','left','FontSize',fs,'Interpreter','latex')
hold('on')
stem(c,c,'LineStyle',':','LineWidth',lwd,'Color','r')
stem(-c,-c,'LineStyle',':','LineWidth',lwd,'Color','r')
xlim([x(1) x(end)])

if prin==1
    % print to postscript
    print -depsc rhoHU1.eps;
else
    sgtitle('Figure 2.6')
    set(gcf,"Name",'Figure 2.6')
end
%InsideREADME
