

%% MR: (Multiple regression data): yXplot
close all;
load('multiple_regression.txt');
y=multiple_regression(:,4);
X=multiple_regression(:,1:3);
yXplot(y,X);

%% MR: (Multiple regression data): traditional fit
close all;
load('multiple_regression.txt');
y=multiple_regression(:,4);
X=multiple_regression(:,1:3);
out=fitlm(X,y);
disp(out)

%% MR: (Multiple regression data): traditional robust fit
close all;
load('multiple_regression.txt');
y=multiple_regression(:,4);
X=multiple_regression(:,1:3);
out=fitlm(X,y,'RobustOpts','on');
disp(out)

%% MR: (Multiple regression data): qqplot with envelopes
load('multiple_regression.txt');
y=multiple_regression(:,4);
X=multiple_regression(:,1:3);
outLM=fitlm(X,y,'exclude','');
res=outLM.Residuals{:,3};
qqplotFS(res,'X',X,'plots',1);
title('qqplot of stud. res.')
 text(-2.4,-2.4,num2str(43),'Units','data');

%% Plot of residuals against fitted values
close all
plot(outLM.Fitted,res,'o')
sel=43;
text(outLM.Fitted(sel)+0.5,res(sel),num2str(sel))
xlabel('Fitted values')
ylabel('Residuals')

%% MR: (Multiple regression data): S estimators with 2 values of breakdown point
conflev=[0.95 0.99];
% Note that the pattern of residuals changes completely
% Using bdp=0.5 the outliers are correctly found, on the other hand using
% bdp=0.25 the masking effect is clear
figure;
h1=subplot(2,1,1);
bdp=0.25;
[out]=Sreg(y,X,'nsamp',3000,'bdp',bdp);
resindexplot(out,'h',h1,'conflev',conflev);
ylabel(['Breakdown point =' num2str(bdp)])
h2=subplot(2,1,2);
bdp=0.5;
[out]=Sreg(y,X,'nsamp',3000,'bdp',bdp);
resindexplot(out,'h',h2,'conflev',conflev);
ylabel(['Breakdown point =' num2str(bdp)])
cascade;


%% Brushing from the resindexplot
close all
bdp=0.5;
% two differentconfidence levels
conflev=[0.95 0.99];

load('multiple_regression.txt');
y=multiple_regression(:,4);
X=multiple_regression(:,1:3);

[out]=Sreg(y,X,'nsamp',3000,'bdp',bdp,'yxsave',1);
resindexplot(out,'conflev',conflev,'databrush',1);
% ylabel(['Breakdown point =' num2str(bdp)])


%% Back to slides monitoring of S estimators

%% Resfwdplot shown as a movie
load('multiple_regression.txt');
y=multiple_regression(:,4);
X=multiple_regression(:,1:3);
% LMS using 1000 subsamples
[out]=LXS(y,X,'nsamp',10000);
% Forward Search
[out]=FSReda(y,X,out.bs);
resfwdplot(out,'movieLength',5)

%% MR (Multiple regression data): Forward EDA datatooltip which monitors bsb
load('multiple_regression.txt');
y=multiple_regression(:,4);
X=multiple_regression(:,1:3);
% LMS using 1000 subsamples
[out]=LXS(y,X,'nsamp',10000);
% Forward Search
[out]=FSReda(y,X,out.bs);
out1=out;
% Create scaled squared residuals
% out1.RES=out.RES.^2;

datatooltip=struct;
datatooltip.SubsetLinesColor=[1 0 0];
resfwdplot(out1,'datatooltip',datatooltip)


%% MR (Multiple regression data): Forward EDA using persistent brushing
load('multiple_regression.txt');
y=multiple_regression(:,4);
X=multiple_regression(:,1:3);
% LMS using 1000 subsamples
[out]=LXS(y,X,'nsamp',10000);
% Forward Search
[out]=FSReda(y,X,out.bs);
out1=out;
% Create scaled squared residuals
out1.RES=out.RES.^2;

% plot minimum deletion residual with personalized options
% mdrplot(out,'ylimy',[1 4.2],'xlimx',[10 60],'FontSize',14,'SizeAxesNum',14,'lwdenv',2);

% Persistent brushing on the plot of the scaled residuals. The plot is:
fground.flabstep='';        % without labels at steps 0 and n
fground.fthresh=3.5^2;      % threshold which defines the trajectories in foreground
fground.LineWidth=1.5;      % personalised linewidth for trajectories in foreground
fground.Color={'r'};        % personalised color (red lines) for trajectories in foreground

databrush=struct;
databrush.bivarfit='';
databrush.selectionmode='Rect'; % Rectangular selection
databrush.persist='on'; % Enable repeated mouse selections
databrush.Label='on'; % Write labels of trajectories while selecting
databrush.RemoveLabels='off'; % Do not remove labels after selection
databrush.Pointer='hand'; % Hand cursor point while selecting
databrush.FlagSize='8'; % Size of the brushed points
databrush.RemoveTool='on'; % Remove yellow selection after finishing brushing
resfwdplot(out1,'fground',fground,'databrush',databrush);

%% Rotate manually
scatter3(X(:,1),X(:,2),y)
xlabel('X1')
ylabel('X2')
zlabel('y')
hold('on');
sel=[9 30 31 38 47 21];
scatter3(X(sel,1),X(sel,2),y(sel),'r')
% sel=[43];
hold('on')
sel1=43;
scatter3(X(sel1,1),X(sel1,2),y(sel1),'k','MarkerFaceColor','k')
text(X(sel1,1),X(sel1,2),y(sel1),'43')


%% MR: Forward EDA persistent brushing with lasso selection.
close all;
load('multiple_regression.txt');
y=multiple_regression(:,4);
X=multiple_regression(:,1:3);
% LMS using 1000 subsamples
[out]=LXS(y,X,'nsamp',10000);
% Forward Search
[out]=FSReda(y,X,out.bs);
out1=out;
% Create scaled squared residuals
out1.RES=out.RES.^2;

fground.flabstep=[15 20];
databrush=struct;
databrush.bivarfit='';
databrush.selectionmode='Lasso'; % Lasso selection
databrush.persist='on'; % Enable repeated mouse selections
databrush.Label='on'; % Write labels of trajectories while selecting
databrush.RemoveLabels='off'; % Do not remove labels after selection
resfwdplot(out1,'fground',fground,'databrush',databrush);

%% MR: Traditional Variable selection (all units)
close all;
load('multiple_regression.txt');
y=multiple_regression(:,4);
X=multiple_regression(:,1:3);
out=fitlm(X,y)

%% Traditional Variable selection (all units) without unit 43
fitlm(X,y,'Exclude',43)

%% MR: Forward EDA rescaled t stat monitoring
close all;
load('multiple_regression.txt');
y=multiple_regression(:,4);
X=multiple_regression(:,1:3);
% LMS using 10000 subsamples
[out]=LXS(y,X,'nsamp',10000);
% Forward Search
[out]=FSReda(y,X,out.bs);
hold('on');
plot(out.Tols(:,1),out.Tols(:,3:end),'LineWidth',3)
for j=3:5
    tj=['t_' num2str(j-2)];
    text(out.Tols(1,1)-1.2,out.Tols(1,j),tj,'FontSize',16)
    
end

quant=norminv(0.95);
v=axis;
lwdenv=2;
line([v(1),v(2)],[quant,quant],'color','g','LineWidth',lwdenv);
line([v(1),v(2)],[-quant,-quant],'color','g','LineWidth',lwdenv);
% plot(out.Tols(end-6:end-1,1),out.Tols(end-6:end-1,3),'LineWidth',4,'color','r')
title('Monitoring of t-stat','FontSize',14);
xlabel('Subset size m');


%% MR: monitoring of t-stat with zoom for first variable
figure;
hold('on');
plot(out.Tols(:,1),out.Tols(:,3:end))
ylim([-3 5]);
quant=norminv(0.95);
v=axis;
lwdenv=2;
line([v(1),v(2)],[quant,quant],'color','g','LineWidth',lwdenv);
line([v(1),v(2)],[-quant,-quant],'color','g','LineWidth',lwdenv);
plot(out.Tols(end-6:end-1,1),out.Tols(end-6:end-1,3),'LineWidth',4,'color','r')
title('Monitoring of t-stat for first variable');
xlabel('Subset size m');
plot(out.Tols(end-7:end-6,1),out.Tols(end-7:end-6,3),'LineWidth',4,'color','b')
plot(out.Tols(end-1:end,1),out.Tols(end-1:end,3),'LineWidth',4,'color','b')
text(out.Tols(end-7,1),out.Tols(end-7,3)+0.7,'43','FontSize',16);
text(out.Tols(end-1,1),out.Tols(end-1,3)+0.7,'43','FontSize',16);
%annotation(gcf,'textarrow',[0.54 0.68],...
%    [0.28 0.44],'TextEdgeColor','none');
text(53,1,'9, 21, 30, 31, 38, 47','FontSize',16,'Rotation',-45);

%% Succesful applications: see slides

%% Bank data see slides

%% Introduction to transformations

%% WD: Score test traditional analysis
% Log transformation is strongly suggested
clearvars;close all;
load('wool.txt','wool');
y=wool(:,4);
X=wool(:,1:3);
out=Score(y,X);
lam="lambda="+(-1:0.5:1)';
disp(array2table(out.Score,'RowNames',lam,"VariableNames","Score test"));

%% WD: fan plot
% Log transformation is strongly suggested
clearvars;close all;
load('wool.txt','wool');
y=wool(:,4);
X=wool(:,1:3);
[outfan]=FSRfan(y,X,'plots',1,'init',7);


%% LD (Loyalty cards data): yXplot
clearvars;close all;
load('loyalty.txt');
y=loyalty(:,4); %#ok<SUSENS>
X=loyalty(:,1:3);
namey='Sales';
nameX={'Number of visits', 'Age', 'Number of persons in the family'};
% yXplot
yXplot(y,X,'nameX',nameX,'namey',namey);

%% LD fan plot
clearvars;close all;
load('loyalty.txt');
y=loyalty(:,4); %#ok<SUSENS>
X=loyalty(:,1:3);
% Compute fan plot to find best value of transformation parameter
[out]=FSRfan(y,X,'plots',1,'la',[-1 -0.5  0 1/4 1/3 0.4 0.5 1]);


%% LD: dynamic brushing from the fan plot with dynamic brushing
% Interactive_example
clearvars;close all;
load('loyalty.txt');
y=loyalty(:,4);
X=loyalty(:,1:3);
namey='Sales';
nameX={'Number of visits', 'Age', 'Number of persons in the family'};

% Compute fan plot to find best value of transformation parameter
[out]=FSRfan(y,X,'plots',1,'la',[-1 -0.5  0 1/4 1/3 0.4 0.5 1]);
%FlagSize controls how large must be the highlighted points. It is a
%parameter of selectdataFS.
fanplot(out,'xlimx',[10 520],'lwd',1.5,'FontSize',11,'SizeAxesNum',11,'nameX',nameX,'namey',namey,'databrush',{'selectionmode' 'Brush'...
    'multivarfit' '2' 'FlagSize' '5'})
% If you wish to do persistent brushing from the fan plot
% uncomment the following line. Notice that multiple trajectories can be selected
% fanplot(out,'databrush',{'selectionmode' 'Rect' 'persist' 'on' 'selectionmode','Brush'})



%% LD: Automatic outlier detection procedure on transformed data
clearvars;close all;
load('loyalty.txt');
y=loyalty(:,4);
X=loyalty(:,1:3);
y1=y.^(0.4);
nameX={'Number of visits', 'Age', 'Number of persons in the family'};

namey1='Sales^{0.4}';
[outFS]=FSR(y1,X,'namey',namey1,'nameX',nameX);


%% LD:  Automatic transformation
close all
load('loyalty.txt');
y=loyalty(:,4); %#ok<SUSENS>
X=loyalty(:,1:3);
n=length(y);
[outFSRfan]=FSRfan(y,X,'plots',1,'init',round(n*0.3),'nsamp',10000,'la',[-1:0.1:1],'msg',0);
[out]=fanBIC(outFSRfan);



%% LD: Interactive monitoring of the trajectories of scaled residuals
% Interactive_example
% using persistent brushing
clearvars;close all;
load('loyalty.txt');
y=loyalty(:,4);
X=loyalty(:,1:3);

y1=y.^(0.4);
[out]=LXS(y1,X,'nsamp',10000);
[out]=FSReda(y1,X,out.bs);

databrush=struct;
databrush.bivarfit='2'; 
databrush.selectionmode='Rect'; % Brush selection
databrush.persist='on'; % Enable repeated mouse selections
databrush.Label='off'; % Write labels of trajectories while selecting
databrush.RemoveLabels='on'; % Do not remove labels after selection
resfwdplot(out,'databrush',databrush);

%% Examples of Extended Yeo Johnson transformation: back to slides

%% Examples of fraud detection: back to slides


%% FP (Fishery product): preliminary analysis
clearvars;close all;
load('fishery.mat');
y=fishery{:,2};
X=fishery{:,1};
% Plot of the original data
plot(X,y,'*');
xlabel('Quantity (Tons)');
ylabel('Values (Thousands of Euros)');

%% FP: Dynamic brushing from the fan plot without persistent option
% Interactive_example
clearvars;close all;
% Multiple trajectories can be selected
load('fishery.mat');
y=fishery{:,2};
X=fishery{:,1};

[out]=FSRfan(y,X,'plots',1,'la',[0 0.5 1]);
fanplot(out,'ylimy',[-40,20],'databrush',{'selectionmode' 'Rect' 'persist' '' 'selectionmode','Brush'},'conflev',1-0.001/length(y))




