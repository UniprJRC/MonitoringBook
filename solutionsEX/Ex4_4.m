%% Surgical Unit data: 
% Traditional robust analysis
close all;
y=hospitalFS(:,5);
X=hospitalFS(:,1:4);

%% Create Figure A.11
% TB rho function: analysis using S estimators with 2 values of breakdown
% point 
% Using bdp=0.5 it is clear that the first 54 units have a pattern of residuals
% which is different from the remaining 54

% 95 and 99 conflev
conflev=[0.95 0.99];

figure;
h1=subplot(2,1,1);
bdp=0.25;
[out]=Sreg(y,X,'nsamp',3000,'bdp',bdp,'rhofunc','bisquare');
resindexplot(out,'h',h1,'conflev',conflev);
ylabel(['Breakdown point =' num2str(bdp)])
h2=subplot(2,1,2);
bdp=0.5;
[out]=Sreg(y,X,'nsamp',3000,'bdp',bdp,'rhofunc','bisquare');
resindexplot(out,'h',h2,'conflev',conflev);
ylabel(['Breakdown point =' num2str(bdp)])
sgtitle('Figure A.11')
set(gcf,"Name",'Figure A.11')

if prin==1
    % print to postscript
    print -depsc SPStwobdp.eps;
end

%% Create Figure A.12
% PD rho function: analysis using S estimators with 2 values of breakdown
% point 
% Using bdp=0.5 it is clear that the first 54 units have a pattern of residuals
% which is different from the remaining 54
figure;
h1=subplot(2,1,1);
bdp=0.25;
[out]=Sreg(y,X,'nsamp',3000,'bdp',bdp,'rhofunc','mdpd');
resindexplot(out,'h',h1,'conflev',conflev);
ylabel(['Breakdown point =' num2str(bdp)])
h2=subplot(2,1,2);
bdp=0.5;
[out]=Sreg(y,X,'nsamp',3000,'bdp',bdp,'rhofunc','mdpd');
resindexplot(out,'h',h2,'conflev',conflev);
ylabel(['Breakdown point =' num2str(bdp)])
sgtitle('Figure A.12')
set(gcf,"Name",'Figure A.12')

if prin==1
    % print to postscript
    print -depsc SPStwobdpPD.eps;
end