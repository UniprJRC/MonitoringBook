%% AR regression data
% This file creates Figures 4.12-4.14
% Note that this file needs interactivity

%% Data loading
load('multiple_regression.txt');
y=multiple_regression(:,4);
X=multiple_regression(:,1:3);
prin=0;

%% Create Figure 4.12
% datatooltip which monitors bsb
% LMS using 1000 subsamples
[out]=LXS(y,X,'nsamp',1000,'msg',0);
% Forward Search
[out]=FSReda(y,X,out.bs);

disp('Click inside the plot to show the units inside subset')
disp('for a given value of subset size m')
disp('Right click to end the brushing')
datatooltip=struct;
datatooltip.SubsetLinesColor=[1 0 0];
standard=struct;
standard.titl='Click inside the plot to show the units inside subset for a given m';

resfwdplot(out,'datatooltip',datatooltip,'standard',standard)


if prin==1
    % print to postscript
    print -depsc ARmonbsb30.eps;
    print -depsc ARmonbsb53.eps;
else
    title('Figure similar to 4.12 (it depends on your clicks)')
    set(gcf,"Name",'Figure 4.12')

end


%% Create Figure 4.14
% MR (Multiple regression data): Forward EDA using persistent brushing
% LMS using 1000 subsamples
[out]=LXS(y,X,'nsamp',20000);
% Forward Search
[out]=FSReda(y,X,out.bs);
out1=out;
% Create scaled squared residuals
% out1.RES=out.RES.^2;

% plot minimum deletion residual with personalized options
% mdrplot(out,'ylimy',[1 4.2],'xlimx',[10 60],'FontSize',14,'SizeAxesNum',14,'lwdenv',2);

% Persistent brushing on the plot of the scaled residuals. The plot is:
fground.flabstep='';        % without labels at steps 0 and n
fground.fthresh=3.5;      % threshold which defines the trajectories in foreground
fground.LineWidth=1.5;      % personalised linewidth for trajectories in foreground
fground.Color={'r'};        % personalised color (red lines) for trajectories in foreground

databrush=struct;
databrush.bivarfit='';
databrush.selectionmode='Rect'; % Rectangular selection
% databrush.persist='on'; % Enable repeated mouse selections
databrush.Label='on'; % Write labels of trajectories while selecting
databrush.RemoveLabels='off'; % Do not remove labels after selection
databrush.Pointer='hand'; % Hand cursor point while selecting
databrush.FlagSize='8'; % Size of the brushed points
databrush.RemoveTool='on'; % Remove yellow selection after finishing brushing
standard=struct;
standard.titl='Drag with the mouse to select a set of trajectories';
resfwdplot(out1,'fground',fground,'standard',standard,'databrush',databrush);

if prin==1
    % print to postscript
    print -depsc ARbrush.eps;
    print -depsc ARbrushyX.eps;
else
    sgtitle('Figure similar to 4.14 bottom (it depends on your brushing)')
    set(gcf,"Name",'Figure 4.14 (bottom)')
end

%% Resfwdplot shown as a movie (NOT SHOWN IN THE BOOK)edit 
load('multiple_regression.txt');
y=multiple_regression(:,4);
X=multiple_regression(:,1:3);
% LMS using 1000 subsamples
[out]=LXS(y,X,'nsamp',10000);
% Forward Search
[out]=FSReda(y,X,out.bs);
resfwdplot(out,'movieLength',5)


%% Create Figure 4.13
figure
% Rotate manually
disp('Rotate manually the 3D scatter')
scatter3(X(:,1),X(:,2),y)
xlabel('X1')
ylabel('X2')
zlabel('y')
hold('on');
sel=[9 30 31 38 47 21];
scatter3(X(sel,1),X(sel,2),y(sel),'r','MarkerFaceColor','r')
% sel=[43];
hold('on')
sel1=43;
scatter3(X(sel1,1),X(sel1,2),y(sel1),'k','MarkerFaceColor','k')
text(X(sel1,1),X(sel1,2),y(sel1),'43')


if prin==1
    % print to postscript
    print -depsc AR3D.eps;
    print -depsc AR3Drot.eps;
else
    title('Figure similar to 4.13 (it depends on your rotation)','Click and drag')
    set(gcf,"Name",'Figure 4.13')
end

%InsideREADME