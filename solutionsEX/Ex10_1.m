%% Analysis of heart rate data
%
% This file creates Figures  A.67-A.70

%% Data loading
Y=load('ms212.txt');
y=Y(:,10)-Y(:,9);
n=length(y);
prin=0;

% Find the 4 largest frequencies.
TA=tabulateFS(y);
TAsor=sortrows(TA,2,'descend');
disp('4 highest frequencies')
disp(TAsor(1:4,:))

Gender=dummyvar(Y(:,4));
Smoke=dummyvar(Y(:,5));
Alcohol=dummyvar(Y(:,6));
Exercise=dummyvar(Y(:,7)); % 3 levels factor Frequency of exercise (1 = high, 2 = moderate, 3 = low)
Run=dummyvar(Y(:,8)); % Indicator for running or sitting

X=[Y(:,1:3) Gender(:,1:end-1)  Smoke(:,1:end-1) Alcohol(:,1:end-1) Exercise(:,1:end-1) Run(:,1:end-1)];

%% Variable selection
disp('Output from variable selection (original scale)')
disp(stepwiselm(X,y))

%% Create left panel of Figure A.67
la=[0.5 0.6 0.7 0.8];
out=FSRfan(y,X,'family','YJ','plots',1,'init',round(n/2),'la',la,'tag','plini');
title('')
if prin==1
    % print to postscript
    print -depsc x1L.eps;
else
    title('Figure A.67 (left panel)')
    set(gcf,"Name",'Figure A.67 (left panel)')
end

%% Transform the response
la=0.7;
ytra=normYJ(y,[],la,'inverse',false);


%% Variable selection in the transformed space
disp('Output from variable selection (trasnformed scale)')
disp(stepwiselm(X,ytra))

%% Create right panel of Figure A.67
% Fan plot positive and negative la=0.7
la=[0.5 0.6 0.7 0.8];

out=FSRfan(y,X(:,9),'family','YJpn','plots',1,'init',round(n/2),'la',la);
title('')
if prin==1
    % print to postscript
    print -depsc x1R.eps;
else
    title('Figure A.67 (right panel)')
    set(gcf,"Name",'Figure A.67 (right panel)')
end

out=FSRfan(y,X(:,9),'family','YJpn','plots',1,'init',round(n/2),'la',0.7);




%% Create Figure A.68
figure

h1=subplot(2,2,1);
outlmori=fitlm(X(:,9),y);
qqplotFS(outlmori.Residuals{:,3},'X',X,'plots',1,'h',h1,'conflev',0.95);

title('')
h2=subplot(2,2,2);
outlmtra=fitlm(X(:,9),ytra);
qqplotFS(outlmtra.Residuals{:,3},'X',X,'plots',1,'h',h2,'conflev',0.95);
title('')

if prin==1
    % print to postscript
    print -depsc x2.eps;
else
    sgtitle('Figure A.68')
    set(gcf,"Name",'Figure A.68')
end




%% Create Figure A.69
figure
subplot(2,2,1)
boxplot(y,X(:,9))
subplot(2,2,2)
boxplot(ytra,X(:,9))
if prin==1
    % print to postscript
    print -depsc x3.eps;
else
    sgtitle('Figure A.69')
    set(gcf,"Name",'Figure A.69')
end

%% Create Figure A.69 (with violinplot)
figure
subplot(2,2,1)
violinplot(X(:,9),y)
subplot(2,2,2)
violinplot(X(:,9),ytra)
if prin==1
    % print to postscript
    print -depsc x3.eps;
else
    sgtitle('Figure not given in the book')
    % set(gcf,"Name",'Figure A.69')
end

%% FS on the original and transformed scale
outORI=FSR(y,X,'plots',0,'msg',0);
disp('Number of outliers detected by FS in the orginal scale')
disp(length(outORI.outliers))

outTRA=FSR(ytra,X(:,9),'plots',0,'msg',0); % ,'nsamp',300000);
disp('Number of outliers detected by FS in the transformed scale')
disp(outTRA.outliers)
disp('Last observation to enter the search in the transformed scale')
disp(outTRA.Un(end,1:2))


%% Create Figure A.70
% X4 MMreg
figure
h1=subplot(2,1,1);
conflev=1-0.01/length(y);
[out]=MMreg(y,X(:,9),'Snsamp',3000,'plots',0);
resindexplot(out,'h',h1,'conflev',conflev,'numlab',{13});
title('')

h1=subplot(2,1,2);
conflev=1-0.01/length(y);
[out]=MMreg(ytra,X(:,9),'Snsamp',3000,'plots',0);
resindexplot(out,'h',h1,'conflev',conflev,'numlab',{1});
title('')

if prin==1
    % print to postscript
    print -depsc x4.eps;
else
    sgtitle('Figure A.70')
    set(gcf,"Name",'Figure A.70')
end

%InsideREADME
