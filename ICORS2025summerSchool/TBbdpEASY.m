function c = TBbdpEASY(bdp)
%TBbdp finds the constant c associated to the supplied breakdown point for Tukey's biweight
% The constant is found through a dichotomic search
%
%
%<a href="matlab: docsearchFS('TBbdpEASY')">Link to the help function</a>
%
%  Required input arguments:
%
%      bdp    : breakdown point. Scalar. Scalar defining breakdown point
%               (i.e a number between 0 and 0.5)
%               Data Types - single|double
%
%  Optional input arguments:
%
% Output:
%
%  c : Requested tuning constant. Scalar. Tuning constatnt of Tukey Biweight
%         function associated to requested breakdown point
%
%
% See also: OPTbdp, HYPbdp, HAbdp
%
% References:
%
% Atkinson et al. (2025), 
%
% Copyright 2008-2025.
% Written by FSDA team
%
%
%<a href="matlab: docsearchFS('TBbdpEASY')">Link to the help page for this function</a>
%
%
%
% Examples:
%
%{
    % Find c given bdp.
    % The constant c associated to a breakdown point of 50% in regression is
    % c=1.547644980928226
    c=TBbdpEASY(0.5)
%}
%

%% Beginning of code

% c = starting point of the iteration
c=5;
% step = width of the dichotomic search (it decreases by half at each
% iteration). Generally it can be smaller. A large value ensures converge
% when bdp is very small and p is very large.
step=200;

% Convergence condition is E(\rho) = \rho(c) bdp
%  where \rho(c) for TB is c^2/6
Erho1=10;
eps=1e-11;
while abs(Erho1-1)>eps
    
    c2=c.^2;
    
    Erho= (chi2cdf(c2,3)/2-3*chi2cdf(c2,5)./(2*c2)+...
        +15*chi2cdf(c2,7)./(6*(c.^4))+ ((c.^2)/3).*(1-normcdf(c)));
    
    Erho1=(Erho./(c.^2))*(6/bdp);
    
    step=step/2;
    if Erho1>1
        c=c+step;
    else
        c=max(c-step,0.1);
    end
     disp([step c Erho1])
end
end
