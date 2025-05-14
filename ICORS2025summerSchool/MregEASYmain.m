%% Example of M estimators in linear regression
rng(1234)
n=200;
p=5;
% data contamination (20 per cent)
outl=1:40;
X=[ones(n,1) randn(n,p-1)];
sig=0.02;
y=X*3*ones(p,1)+sig*randn(n,1);
% Point mass contamination for 20% of the observations
y(outl)=-20; 
X(outl,2:end)=2;
group=ones(n,1);
group(outl)=2;
% plot the data and show the point mass contamination
yXplot(y,X,group);

%% Set initial values and call mregEASY
initialbeta=randn(p,1);
initialscale=mad(y,1)/0.675;
c=1.547;
out=MregEASY(y,X,initialbeta,c,initialscale);
resM=y-X*out.betarw;
resindexplot(resM)

%% Compare with non robust fit
outOLS=fitlm(X(:,2:end),y);
disp(outOLS)
resindexplot(outOLS.Residuals{:,2})

%% Apply automatic outlier detection procedure based on the forward search
X1=X(:,2:end);
FSR(y,X1)

%% Forward search with exploratory purposes
outLXS=LXS(y,X1);
outFS=FSReda(y,X1,outLXS.bs);
resfwdplot(outFS,'databrush',1)

