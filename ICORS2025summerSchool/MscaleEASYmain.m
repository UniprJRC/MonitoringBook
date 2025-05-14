%% Example of robust estimate of scale
rng(1)
nout=5;
n=100;
u=[randn(n,1); 200*ones(nout,1)];
est=MscaleEASY(u,1.5476);


%% Simulation study to check the distribution of robust estimate of scale
rng(1)
nout=5;
n=1000;
nsimul=10000;
est=zeros(nsimul,1);
for i=1:nsimul
    %u=randn(n,1);
    u=2*[randn(n,1); 200*ones(nout,1)];
    
    est(i)=MscaleEASY(u,1.5476);
end

boxplot(est)

