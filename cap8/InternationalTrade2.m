%% Heteroskedasticity: International Trade Data 2.
% This file creates Figures 8.16 and 8.18.
% File which creates Figure 8.17 is called InternationalTrade2Interactive.m

%% Beginning of code
load inttrade2.mat
% This dataset refers to 0307491800
X=inttrade2{:,1};
y=inttrade2{:,2};

X=X./max(X);
Z=log(X);
n=length(y);

close all
prin=0;
bonflev=0.99;

%% Create Figure 8.16
scatter(X,y)
ylabel('Value')
xlabel('Weight')
if prin==1
    print -depsc P307scatter.eps;
else
    set(gcf,'Name', 'Figure 8.16');
    title('Figure 8.16')
end


%% Create top panel of Figure 8.18
typeH='har';

outH=FSRH(y,X,Z,'init',round(n*0.8),'plots',0, ...
    'typeH',typeH,'bonflev',bonflev);

% FSRHeda and forecasts
[outLXS]=LXS(y,X,'nsamp',10000);
outHEDA=FSRHeda(y,X,Z,outLXS.bs,'init',round(0.75*length(y)),'typeH',typeH);

outl=[outH.ListOut];
bsb=1:n;
bsb(outl)=[];
figure
forecastH(y,X,Z,'outH',outHEDA,'bsb',bsb,'conflev',1-0.01/n);
ylabel('Value')
xlabel('Weight')
% Zoom for X
xlim([0 0.17])
ylim([-5000 140000])
if prin==1
    print -depsc P307bandsHhar.eps;
else
    set(gcf,'Name', 'Top panel of Figure 8.18');
    title('Figure 8.18 (top panel)')
end


%% Create bottom panel of Figure 8.18
typeH='art';

outH=FSRH(y,X,Z,'init',round(n*0.8),'plots',0, ...
    'typeH',typeH,'bonflev',bonflev);

% FSRHeda and forecasts
[outLXS]=LXS(y,X,'nsamp',10000);
outHEDA=FSRHeda(y,X,Z,outLXS.bs,'init',round(0.75*length(y)),'typeH',typeH);

outl=[outH.ListOut];
bsb=1:n;
bsb(outl)=[];
figure
forecastH(y,X,Z,'outH',outHEDA,'bsb',bsb,'conflev',1-0.01/n);
ylabel('Value')
xlabel('Weight')
% Zoom for X
xlim([0 0.17])
ylim([-5000 140000])
if prin==1
    print -depsc P307bandsHzoom.eps;
else
    set(gcf,'Name', 'Bottom panel of Figure 8.18');
    title('Figure 8.18 (bottom panel)')
end

%InsideREADME