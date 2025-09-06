%% Difference among the 3 tests
%
% This file creates Figure A.3

%% Beginning of code
close all
prin=0;
theta=3;
lw=2;
x=-8:0.01:10;
fx=-(x-theta).^2;
x0=sqrt(20)+theta;
fx0=-20;
plot(x,fx,'Color','k','LineWidth',2)

% The two horizontal lines for LR test
line([-8;3],[0;0],'LineStyle','--','LineWidth',lw,'Color','r')
line([-8;x0],[-20;-20],'LineStyle','--','LineWidth',lw,'Color','r')

% The two vertical lines for Wald test
line([theta;theta],[-90;0],'LineStyle','--','LineWidth',lw,'Color','b')
line([x0;x0],[-90;fx0],'LineStyle','--','LineWidth',lw,'Color','b')
set(gca,"XTickLabel","","YTickLabel","")
ylim([-90 10])

hl=refline(-2*sqrt(20),20+6*sqrt(20));
hl.Color='m';
hl.LineWidth=2;

ylabel('Loglikelihood')

% [-4 -4],[-20 0]
ylim([-90 20])

[figx, figy]=aux.dsxy2figxy([-7 -7],[-20 0]);
annotation("doublearrow",figx,figy);
annotation("textbox",[figx(1)+0.005 figy(1)+0.01 0.3 0.1],'String','Likelihood ratio test', ...
    'EdgeColor','w','Color','r','FontSize',12)


[figx, figy]=aux.dsxy2figxy([3 x0],[-60 -60]);
an = annotation("doublearrow",figx,figy);
annotation("textbox",[figx(1)+0.01 figy(1)+0.001 0.3 0.1],'String','Wald test', ...
    'EdgeColor','w','Color','b','FontSize',12)

%[figx, figy]=aux.dsxy2figxy([x0 -20],[x0 -60]);
%annotation("textbox",[figx(1)+0.01 figy(1)+0.001 0.1 0.1],'String','Score test','EdgeColor','w')

text(7,-10,'Score Test','Rotation',-50,'Color','m','FontSize',12)


text(theta,-95,'$\hat \theta$','Color','k','FontSize',16,'Interpreter','latex')
text(x0,-95,'$\theta_0$','Color','k','FontSize',16,'Interpreter','latex')
text(10,-100,'$\theta$','Color','k','FontSize',16,'Interpreter','latex')
box off

if prin==1
    % print to postscript
    print -depsc liktests.eps;
else
    title("Figure A.3")

end

%InsideREADME 