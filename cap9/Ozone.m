%% Ozone data (reduced and full).
%
% This file creates Figures 9.1 and 9.2

%% cdsplot with all default options.
% Load Ozone data (reduced data)
X=load('ozone.txt');
% Transform the response using logs
X(:,end)=log(X(:,end));
% Add a time trend
X=[(-40:39)' X];
% Define y
y=X(:,end);
% Define X
X=X(:,1:end-1);
labels={'Time','1','2','3','4','5','6','7','8'};
prin=0;

% Robust model selection using Cp
[Cpms]=FSRms(y,X,'labels',labels,'smallpint',5:9);
% Candlestick plot
cdsplot(Cpms);
% Use option cpbrush for brushing the cds plot
% cdsplot(Cpms,'cpbrush',1);

ylim([-1 45])
if prin==1
    % print to postscript
    print -depsc ozonered.eps;
end

set(gcf,'Name', 'Figure 9.1');
title('Figure 9.1')

%% Full ozone
% cdsplot with optional arguments.
% Load Ozone data (full data)
X=load('ozone_330_obs.txt');
y=log(X(:,9));
Time1=[(1:165)';(165:-1:1)'];
X=[Time1 X(:,1:8)];
labels={'Time','1','2','3','4','5','6','7','8'};
outms=FSRms(y,X,'labels',labels,'smallpint',5:9);
figure
cdsplot(outms)
% Use option cpbrush for brushing the cds plot
% cdsplot(outms,'cpbrush',1);

if prin==1
    % print to postscript
    print -depsc ozonefull.eps;
end

set(gcf,'Name', 'Figure 9.2');
title('Figure 9.2')

% cdsplot(outms,'laboutl',1);
% cdsplot(outms,'cpbrush',1,'laboutl',1);

%InsideREADME 
