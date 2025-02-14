%% NCI 60 Cancer Cell Panel Data.
%
% This file creates Figures  10.47-10.62
% and Tables 10.9-10.11.

%% Beginning of code
close all
clear
% Data from national cancer institute
load nci60

nameX=["x134"; "x10193"; "x1106"; "x14785"; "x20125"; "x8510"; "x8502"];
nameXy=[nameX; "y"];
% Select the 7 most important variables from sparse LTS
Xytable=nci60(:,nameXy);

nameXnew="x"+(1:size(Xytable,2)-1)';
Xytable.Properties.VariableNames(1:end-1)=nameXnew;

y=Xytable.y;
n=length(y);
% Xtable=
X=Xytable{:,1:end-1};

prin=0;

%% Create Table 10.9
namesTab=["Original NCI name" "Regression variable"];
Tab108=array2table([nameX,nameXnew],"VariableNames",namesTab);
disp(Tab108)


%% Create Table 10.10
% Standard regression with all variables
mdlyall=fitlm(Xytable);
disp('Table 10.10')
disp(mdlyall)

%% Stepwise regression
disp("Stepwise regression")
stepwiselm(Xytable)

%% Create Figure 10.47
%  outlier detection
% 5 outliers found
outf=FSR(y,X,'init',round(n*0.7));

pl_fsr=findobj(0, 'type', 'figure','tag','pl_fsr');
close(pl_fsr(end))


if prin==1
    % print to postscript
    print -depsc canc1.eps;
else
    sgtitle('Figure 10.47')
    set(gcf,"Name",'Figure 10.47')
end
drawnow


%% Create Figure 10.48
% QQ plots
figure
conflev=0.95;
nr=2;
nc=2;
h1=subplot(nr,nc,1);
res=mdlyall.Residuals{:,3};
qqplotFS(res,'X',X,'plots',1,'h',h1,'conflev',conflev);
% title('qqplot of stud. res.')
title('')

% Plot residuals excluding outl
mdlyall=fitlm(X,y,'Exclude',outf.outliers);
h2=subplot(nr,nc,2);
good=setdiff(1:n,outf.outliers);
Xg=X(good,:);
yg=y(good);
resg=mdlyall.Residuals{good,3};
qqplotFS(resg,'X',Xg,'plots',1,'h',h2,'conflev',conflev);


if prin==1
    % print to postscript
    print -depsc canc2.eps;
else
    sgtitle('Figure 10.48')
    set(gcf,"Name",'Figure 10.48')
end

%% Create Figure 10.49
% Monitoring of residuals
[outLXS]=LXS(y,X,'nsamp',10000);
% Forward Search
[outFS]=FSReda(y,X,outLXS.bs);

fground=struct;
fground.fthresh=[-3 1.7];
fground.Color={'r'};
fground.flabstep=58;
bground='';

resfwdplot(outFS,'datatooltip',1,'fground',fground, ...
    'bground',bground)
if prin==1
    % print to postscript
    print -depsc canc2a.eps;
else
    title('Figure 10.49')
    set(gcf,"Name",'Figure 10.49')
end

%% Create Figure 10.50
% monitoring plot of added variable 𝑡-statistics for all
% observations. 
% FSRaddt in the model without the interactions
figure
outADDt=FSRaddt(y,X,'plots',1,'nsamp',10000);
if prin==1
    % print to postscript
    print -depsc canc3.eps;
else
    title('Figure 10.50')
    set(gcf,"Name",'Figure 10.50')
end



%% Create Figure 10.51
% FSRaddt after deleting the outliers
% The trajectories, not only that for $x_7$,
% are now well-behaved.
% It seems that of the seven variables, 
% $x_3$ is now not significant.
figure
FSRaddt(yg,Xg,'plots',1);

if prin==1
    % print to postscript
    print -depsc canc4.eps;
else
    title('Figure 10.51')
    set(gcf,"Name",'Figure 10.51')
end


%% Create Figure 10.52
% Transformation
nini=16;
la=0.5:0.1:1;
FSRfan(y,X,'la',la,'family','YJ','plots',1,'init',nini,'tag','plini');
title('')
if prin==1
    % print to postscript
    print -depsc canc5.eps;
else
    title('Figure 10.52')
    set(gcf,"Name",'Figure 10.52')
end

%% Create Figure 10.53
% Create fanplotori (bottom panel)
% pos and neg for 0.9
lasel=0.9;
ylimy1=5;
outpn=FSRfan(y,X,'nsamp',100000,'la',lasel,'family','YJpn','plots',1,'init',round(nini));
title('')
if prin==1
    % print to postscript
    print -depsc canc6.eps;
else
    title('Figure 10.53')
    set(gcf,"Name",'Figure 10.53')
end



%% Create Figure 10.54
% Find best automatic value of lambda
la=0:0.25:1.5;

outFSRfan=FSRfan(y,X,'la',la,'nsamp',50000,'family','YJ','plots',0,'init',nini/2);
outini=fanBIC(outFSRfan);
labest=outini.labest;
if prin==1
    % print to postscript
    print -depsc canc7.eps;
else
    sgtitle('Figure 10.54')
    set(gcf,"Name",'Figure 10.54')
end



%% Prepare input for Figure 10.55 (left and right panel)
[outFSRfanpn]=FSRfan(y,X,'msg',1,'family','YJpn','la',labest,'plots',0,'nsamp',50000);

%% Create Figure 10.55
out1=fanBICpn(outFSRfanpn);

fig=findobj(0,'tag','pl_BIC');
figure(fig(1))
if prin==1
    % print to postscript
    print -depsc canc8a.eps;
else
    set(gcf,'Name', 'Figure 10.55 (left panel)');
end
fig=findobj(0,'tag','pl_AGI');
figure(fig(1))
if prin==1
    set(gcf,'Name', 'Figure 10.55 (right panel)');
else
    print -depsc canc8b.eps;
end

fig=findobj(0,'tag','pl_nobs');
close(fig(1))

fig=findobj(0,'tag','pl_R2c');
close(fig(1))


%% Create Table 10.11
% ANOVA table after removing x3 and the 5 outliers
mdlysel=stepwiselm(X,y,'Exclude',outf.outliers);
disp('Table 10.11')
disp(mdlysel)


%% Create Figure 10.56
% Robust model selection using Cp
[Cpms]=FSRms(yg,Xg,'smallpint',3:7,'nsamp',10000);
% Candlestick plot
figure
cdsplot(Cpms);

if prin==1
    % print to postscript
    print -depsc canc9.eps;
else
    sgtitle('Figure 10.56')
    set(gcf,"Name",'Figure 10.56')
end

%% Non parametric transformation
outAV=avas(y,X);
aceplot(outAV,'VarNames',nameXy)

pl_ty=findobj(0, 'type', 'figure','tag','pl_ty');
figure(pl_ty(1))
if prin==1
    % print to postscript
    print -depsc canc10.eps;
else
    sgtitle('Figure 10.57')
    set(gcf,"Name",'Figure 10.57')
end

pl_tX=findobj(0, 'type', 'figure','tag','pl_tX');
close(pl_tX(1))
drawnow

%% Find Adjusted R2 using AVAS  transformed X and y
disp(fitlm(outAV.tX,outAV.ty))

%% Create Figures 10.58 and 10.59
% RAVAS model selection with monotonicity constraint in X
outMSm=avasms(y,X,'l',3*ones(size(X,2),1),'plots',0);

% See which options are found for the best model
% avasmsplot(outMSm)

j=1;
outjm=outMSm{j,"Out"};
outm=outjm{:};
% aceplot(outm,'VarNames',nameXy)
aceplot(outm)
disp("number of outliers found by RAVAS")
disp(length(outm.outliers))


pl_ty=findobj(0, 'type', 'figure','tag','pl_ty');
figure(pl_ty(1))
if prin==1
    print -depsc canc11.eps;
else
    sgtitle('Figure 10.58')
    set(gcf,"Name",'Figure 10.58')
end

pl_tX=findobj(0, 'type', 'figure','tag','pl_tX');
figure(pl_tX(1))
if prin==1
    print -depsc canc12.eps;
else
    sgtitle('Figure 10.59')
    set(gcf,"Name",'Figure 10.59')
end
drawnow

%% Create Figure 10.60
% call addition t stat
outl=outm.outliers;
selRAVAS=setdiff(1:length(y),outl);
figure
outjj=FSRaddt(outm.ty(selRAVAS),outm.tX(selRAVAS,:),'plots',1);
if prin==1
    % print to postscript
    print -depsc canc13.eps;
else
    title('Figure 10.60')
    set(gcf,"Name",'Figure 10.60')
end


%% Create Figure  10.61
% Robust model selection using Cp 
% (removing the 4 outliers)
[Cpms1]=FSRms(outm.ty(selRAVAS),outm.tX(selRAVAS,:));
figure
cdsplot(Cpms1);
if prin==1
    % print to postscript
    print -depsc canc14.eps;
else
    sgtitle('Figure 10.61')
    set(gcf,"Name",'Figure 10.61')
end

%% Create Figure 10.62: yXplot
group=ones(n,1);
group(outm.outliers)=2;
%'nameX',nameX,
yXplot(outm.ty,outm.tX,'group',group,'namey','ty');
if prin==1
    % print to postscript
    print -depsc canc15.eps;
else
    sgtitle('Figure 10.62')
    set(gcf,"Name",'Figure 10.62')
end

%InsideREADME