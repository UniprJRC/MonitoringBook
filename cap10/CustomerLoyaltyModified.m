% Modified Customer Loyalty data.
%
% This file creates Figures 10.37-10.46
% and Table 10.7.

%% Beginning of code
close all
clear
load ConsLoyaltyRet.mat
Xytable=ConsLoyaltyRet(:,2:end);
nameXy=Xytable.Properties.VariableNames;
nameX=nameXy(1:end-1);
X=Xytable{:,1:end-1};
y=Xytable{:,end};
ytra=sqrt(y);
n=length(y);

% Contaminate the data
ss=Xytable.Price==10 & Xytable.NegativePublicity<0.2;
kk=3;
y(ss)=y(ss)-kk;
Xytable{ss,end}= Xytable{ss,end}-kk;
prin=0;

%{
group=ones(n,1);
group(ss)=2;
yXplot(Xytable(:,end),Xytable(:,1:end-1),'group',group)
%}

%% Create Table 10.7
% Standard regression with all variables
mdl=fitlm(Xytable);
disp('Table 10.7')
disp(mdl)

%% Create Figure 10.37
h1=subplot(2,2,1);
res=mdl.Residuals{:,3};
qqplotFS(res,'X',X,'plots',1,'h',h1);

subplot(2,2,2)
plotResiduals(mdl,'symmetry','ResidualType','studentized')
title('')

if prin==1
    % print to postscript
    print -depsc figs\modCL2.eps;
else
    sgtitle('Figure 10.37')
    set(gcf,"Name",'Figure 10.37')
end

drawnow

%% Figures 10.38 and 10.39
% These two Figures are created by file
% CustomerLoyaltyModifiedInteractive.m

%% Create Figure 10.40
[outLXS]=LXS(y,X,'nsamp',50000);
% Forward Search
[out]=FSReda(y,X,outLXS.bs);

resfwdplot(out,'datatooltip',1)
if prin==1
    % print to postscript
    print -depsc figs\modCL5.eps;
else
    title('Figure 10.40')
    set(gcf,"Name",'Figure 10.40')
end

drawnow

%% Prepare input for Figure 10.41
% 51 outliers found
outFSR=FSR(y,X,'plots',0);

% FSRaddt in the model without the interactions
outADDt=FSRaddt(y,X,'plots',0);

%% Create Figure 10.41
fanplotFS(outADDt,'highlight',outFSR.outliers,'tag','pl_fan1');
title('')
if prin==1
    % print to postscript
    print -depsc modCL6.eps;
else
    title('Figure 10.41')
    set(gcf,"Name",'Figure 10.41')
end


%% Prepare input for Figure 10.42

outFSRfan=FSRfan(y,X,'plots',0);
% Best automatic value of lambda is 0.5
outBIC=fanBIC(outFSRfan,'plots',0);

% Units highlighting in the different trajectories using fanBIC
Highl=NaN(1000,5);
la=[-1 -0.5 0 0.5 1];
seq=1:n;
for j=1:length(la)
    oultlj=seq(outBIC.BBla(:,j)<2);
    Highl(1:length(oultlj),j)=oultlj;
end

%% Create Figure 10.42
% Fanplot with outliers highlighted

fanplotFS(outFSRfan,'highlight',Highl,'ylimy',[-8 35]);
title('')

if prin==1
    % print to postscript
    print -depsc figs\modCL7.eps;
else
    title('Figure 10.42')
    set(gcf,"Name",'Figure 10.42')
end




%% Non parametric transformation
outAV=avas(y,X);
aceplot(outAV,'VarNames',nameXy,'notitle',true);

pl_ty=findobj(0, 'type', 'figure','tag','pl_ty');
figure(pl_ty(1))
if prin==1
    % print to postscript
    print -depsc modCL9.eps;
else
    sgtitle('Figure 10.43')
    set(gcf,"Name",'Figure 10.43')
end

pl_tX=findobj(0, 'type', 'figure','tag','pl_tX');
figure(pl_tX(1))
if prin ==1
    print -depsc modCL10.eps;
else
    sgtitle('Figure 10.44')
    set(gcf,"Name",'Figure 10.44')
end

drawnow

% fitlm(outAV.tX,outAV.ty,'Exclude','','VarNames',nameXy)


%% Prepare the input for Figure 10.45
% avas model selection with no constraint in X
disp('Note that automatic model selection in this case might take more than one minute')
outMS=avasms(y,X,'plots',0);
% avasmsplot(outMS)

j=1;
outj=outMS{j,"Out"};
out=outj{:};
%% Create Figure 10.45
aceplot(out,'VarNames',nameXy,'notitle',true)


pl_ty=findobj(0, 'type', 'figure','tag','pl_ty');
figure(pl_ty(1))
if prin==1
    % print to postscript
    print -depsc modCL11.eps;
else
    sgtitle('Figure 10.45')
    set(gcf,"Name",'Figure 10.45')
end
pl_tX=findobj(0, 'type', 'figure','tag','pl_tX');
close(figure(pl_tX(1)))

%% Create Figure 10.46
% find F value
% fitlm(out.tX,out.ty,'Exclude',out.outliers,'VarNames',nameXy)

group=ones(length(y),1);
group(out.outliers)=2;
yXplot(out.ty,out.tX,'nameX',nameX,'group',group);
if prin ==1
    print -depsc modCL12.eps;
else

    sgtitle('Figure 10.46')
    set(gcf,"Name",'Figure 10.46')
end

%% Confirmation with FSR
% outTRA=FSR(out.ty,out.tX);



%InsideREADME

