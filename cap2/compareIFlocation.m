%% Compare IF of different location estimators (use bdp=0.5 or eff=0.95)
close all
clear
FontSize=14;
FontSizetitl=12;
LineWidth=2;

bdp=0.5;
eff=0.95;
% if bdpboo is true the analysis will be done from bdp=0.5
% else the analysis will be done for eff=0.95
bdpboo=false;

col=repmat({'m';'k';'g';'b';'c'},3,1);
linst=repmat({'-';'--';':';'-.';'--';':'},3,1);

ylim1=-4.1;
ylim2=4.1;
x=(-7:0.001:7)';

xlim1=min(x);
xlim2=max(x);
dd=100;

% k = supCVC parameter in HYP link
k=4.5;

if bdpboo ==true
    % Fix bdp to 0.5
    cHA=HAbdp(bdp,1);
    cTB=TBbdp(bdp,1);
    [cHYP,A,B,d]=HYPbdp(bdp,1,k);
    cOPT=OPTbdp(bdp,1);
    cPD=PDbdp(bdp);


    rhoHYPsup=HYPrho(200000,[cHYP,k,A,B,d]);
    kHYP=rhoHYPsup*bdp;

    rhoOPTsup=OPTrho(200000,cOPT);
    kOPT=rhoOPTsup*bdp;

    rhoPDsup=PDrho(200000,cPD);
    kPD=rhoPDsup*bdp;

    rhoHAsup=HArho(200000,cPD);
    kHA=rhoPDsup*bdp;

    rhoTBsup=cTB^2/6;
    kTB=rhoTBsup*bdp;

else
    % Fix eff to 0.95 and find corresponding bdp
    cHA=HAeff(eff,1);
    rhoHAsup=HArho(200000,cHA);
    % Find bdp associated to eff
    [bdpHA,efftest]=HAc(cHA,1);
    assert(abs(eff-efftest)<1e-5,"Lack of convergence on HA")
    kHA=rhoHAsup*bdpHA;


    [cHYP,A,B,d]=HYPeff(eff,1,k);
    rhoHYPsup=HYPrho(200000,[cHYP,k]);
    [bdpHYP,efftest]=HYPc(cHYP,1,'k',k);
    assert(abs(eff-efftest)<1e-5,"Lack of convergence in HYP")
    kHYP=rhoHYPsup*bdpHYP;


    cOPT=OPTeff(eff,1);
    rhoOPTsup=OPTrho(200000,cOPT);
    [bdpOPT,efftest]=OPTc(cOPT,1);
    assert(abs(eff-efftest)<1e-5,"Lack of convergence in OPT")
    kOPT=bdpOPT*rhoOPTsup;

    cPD=PDeff(eff);
    rhoPDsup=1;
    [bdpPD,efftest]=PDc(cPD);
    assert(abs(eff-efftest)<1e-5,"Lack of convergence in TB")
    kPD=bdpPD*rhoOPTsup;

    cTB=TBeff(eff,1);
    % kc = E(rho) = sup(rho)*bdp
    [bdpTB,efftest]=TBc(cTB,1);
    assert(abs(eff-efftest)<1e-5,"Lack of convergence in TB")
    rhoTBsup=cTB^2/6;
    kTB=rhoTBsup*bdpTB;
end


% cOPT=cOPT/3;

% iHU =integral(@(u)u.*(HUpsider(u,cHU)).*normpdf(u),-dd,dd);
iHA =integral(@(u)(HApsider(u,cHA)).*normpdf(u),-dd,dd);
iTB =integral(@(u)(TBpsider(u,cTB)).*normpdf(u),-dd,dd);
iHYP=integral(@(u)(HYPpsider(u,[cHYP,k,A,B,d])).*normpdf(u),-dd,dd);
iOPT=integral(@(u)(OPTpsider(u,cOPT)).*normpdf(u),-dd,dd);
iPD =integral(@(u)(PDpsider(u,cPD)).*normpdf(u),-dd,dd);


%% plot iF for different location estimators
close all
hold('on')

ifTB=(TBpsi(x,cTB))/iTB;
plot(x,ifTB,'LineWidth',LineWidth,'LineStyle',linst{1})


ifHA=(HApsi(x,cHA))/iHA;
plot(x,ifHA,'LineWidth',LineWidth,'LineStyle',linst{2})

ifHYP=(HYPpsi(x,[cHYP,k,A,B,d]))/iHYP;
plot(x,ifHYP,'LineWidth',LineWidth,'LineStyle',linst{3})


ifOPT=(OPTpsi(x,cOPT))/iOPT;
plot(x,ifOPT,'LineWidth',LineWidth,'LineStyle',linst{4})

ifPD=(PDpsi(x,cPD))/iPD;
plot(x,ifPD,'LineWidth',LineWidth,'LineStyle',linst{5})

xlabel('$u$','Interpreter','Latex','FontSize',FontSize)
% title('Tukey biweight','FontSize',FontSizetitl)


if bdpboo ==true
    y= sqrt(2*pi)*sign(x)/2;
    plot(x,y,'LineWidth',LineWidth,'LineStyle',linst{6})
    ylim([ylim1 ylim2])
    legend(["TB" "HA"  "HYP"  "OPT" "PD" "Me"],'Location','best','AutoUpdate','off')
    max([y ifTB ifHA ifHYP ifOPT ifPD])';

else
    legend(["TB" "HA"  "HYP"  "OPT" "PD"],'Location','best','AutoUpdate','off')
    max([ifTB ifHA ifHYP ifOPT ifPD])'

end


xlim([xlim1 xlim2])
yline(0)

%
% [iHU iHA  iTB iHYP iOPT iPD]
%
prin=0;
if prin==1
    % print to postscript
    print -depsc IFlocbdp05.eps;
    print -depsc IFloceff095.eps;
end

