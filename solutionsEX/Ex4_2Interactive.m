%% Hawkins data:  brushing residuals from monitoring S residuals
%
% This file creates Figures A.7--A.9 in an interactive way 

%% Hawkins data loading
close all;
load('hawkins.txt');
y=hawkins(:,9);
X=hawkins(:,1:8);

n=length(y);
prin=0;

%%  Prepare the input for Figures A.7, A.8 and A.9

% Perform both the FS and the S residuals monitoring
[outLXS]=LXS(y,X,'nsamp',10000);
[outFS]=FSReda(y,X,outLXS.bs);

% Sregeda with bisquare link brushing
outTB=Sregeda(y,X,'plots',1,'rhofunc','bisquare');
yl=5;
ylim([-yl yl])
% The information about the order of entry of the units in the FS is added
% to outTB
outTB.Un=outFS.Un;

%% Create Figure A.7-A.9
% Show the plot of minimum deletion residuals
mdrplot(outFS,'ylimy',[1 8])

standard=struct;
standard.ylim=[-yl yl];

databrush=struct;
databrush.bivarfit='';
databrush.selectionmode='Brush'; % Brush selection
% databrush.persist='on'; % Enable repeated mouse selections
databrush.Label='off'; % Write labels of trajectories while selecting
databrush.RemoveLabels='off'; % Do not remove labels after selection

disp('Brush the monitoring residual plot')
resfwdplot(outTB,'databrush',databrush,'datatooltip','','standard',standard)

if prin==1
    % print to postscript
    print -depsc HDtbexeres6.eps;
    print -depsc HDtbexemdr6.eps;

    print -depsc HDtbexeres.eps;
    print -depsc HDtbexemdr.eps;
    print -depsc HDtbexeyXplot.eps;
else
   % title('Output which depends on your brushing')
end

%InsideREADME 