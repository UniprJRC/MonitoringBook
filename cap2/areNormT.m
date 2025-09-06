%% Compute empirical and theoretical ARE(med, Mean) under the normal distribution and the Student t.
%
% This file creates Figure 2.3.
%


%% Theoretical ARE(med, Mean) when the data are from the Normal distribution
% Var(sample mean)/Var(sample median)
% Initial part of Section 2.1.2.
% For the final part of Section 2.1.2 see file areVarComparison.m.
close all
varmedian=1/(2*normpdf(0))^2;
varmean=1;
VarRatio=varmean/varmedian;
disp(['Theoretical ARE(med,mean) under the normal distribution='  num2str(VarRatio)] )

%% Empirical ARE(med, Mean) when the data are from the Normal distribution
% This section is not mentioned in the book
n=10000000;
nsimul=100; % Increare nsimul if you like greater precision
meandistr=zeros(nsimul,1);
mediandistr=zeros(nsimul,1);

parfor j=1:nsimul
    y=randn(n,1);
    meandistr(j)=mean(y);
    mediandistr(j)=median(y);
end

disp('Empirical ARE(med, Mean) under the normal distribution=')
disp([num2str(nsimul) ' simulations using n=' num2str(n)])
disp(var(meandistr)/var(mediandistr))



%% Empirical ARE(med,mean) under the Student t_5
% This section is not mentioned in the book
n=100;
nsimul=1000;
meandistr=zeros(nsimul,1);
mediandistr=zeros(nsimul,1);
% nu = degrees of freedom of Student T
nu = 5;

for j=1:nsimul
    y=trnd(nu, n,1);
    meandistr(j)=mean(y);
    mediandistr(j)=median(y);
end

disp(['Empirical ARE(med, Mean) under t' num2str(nu)])
disp([num2str(nsimul) ' simulations using n=' num2str(n)])
disp(var(meandistr)/var(mediandistr))

%% Compute Empirical ARE as function of degrees of freedom
n=100;
nsimul=50000;
nuall=2.1:0.1:10;
lnu=length(nuall);
VarRatioE=zeros(1,lnu);
VarRatioT=zeros(1,lnu);

meandistr=zeros(nsimul,1);
mediandistr=zeros(nsimul,1);
% nu = degrees of freedom of Student T
ij=0;
for nu=nuall
    ij=ij+1;
    parfor j=1:nsimul
        y=trnd(nu, n,1);
        meandistr(j)=mean(y);
        mediandistr(j)=median(y);
    end
    disp(['Degrees of freedom: ' num2str(nu)])
    VarRatioE(ij)=var(meandistr)/var(mediandistr);
end

%% Plot the empirical ARE  as function of degrees of freedom of Student T
ld=1.2;
fs=16;
plot(nuall,smooth(VarRatioE),'LineWidth',ld)
hline=refline(0,1);
hline.Color = 'r';
xlabel('Degrees of freedom of Student $t$','FontSize',fs-2,'Interpreter','latex')
ylabel('Empirical ARE(med,$\overline y$)','Interpreter','latex','FontSize',fs)
title('Figure not given in the book')


%% Create input for Figure 2.3
% Theoretical ARE curve as function of degrees of freedom
% Var(sample mean)/Var(sample median)
% nu = degrees of freedom of Student T
ij=0;
nuall=2.1:0.1:10;
for nu=nuall
    ij=ij+1;
    varmedian=1/(2*tpdf(0,nu))^2;
    varmean=nu/(nu-2);
    VarRatioT(ij)=varmean/varmedian;
end

%% Create Figure 2.3
ld=1.2;
fs=16;
figure
hold('on')
% plot(nuall,(VarRatioE),'r','LineWidth',ld)
plot(nuall,VarRatioT,'b', 'LineWidth',ld)

hline=refline(0,1);
hline.Color = 'r';
xlabel('Degrees of freedom of Student $t$','FontSize',fs-2,'Interpreter','latex')
ylabel('ARE(med,$\overline y$)','Interpreter','latex','FontSize',fs)

prin=0;
if prin==1
    % print to postscript
    print -depsc AREstudT.eps;
else
    title('Figure 2.3')
    set(gcf,"Name",'Figure 2.3')
end


%% ARE for selected degrees of freedom: numbers before (2.14)
nusel=5:-1:3; % degrees of freedom selected
[~,posnusel]=intersect(nuall,nusel);
VarRatioTsel=100*flip(VarRatioT(posnusel));
rownam="t_"+nusel+" ARE(med,mean)";
VarRatioTselt=array2table(VarRatioTsel',"RowNames",rownam, ...
    "VariableNames","ARE for selected degrees of freedom");
format bank
disp(VarRatioTselt)


%InsideREADME
