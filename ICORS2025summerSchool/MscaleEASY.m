function sc = MscaleEASY(u, c, initialsc, tol, maxiter)
%Mscale finds the M estimator of the scale
%
%
%<a href="matlab: docsearchFS('Mscale')">Link to the help function</a>
%
% Required input arguments:
%
%    u:       : residuals or Mahalanobis distances. Vector.
%               n x 1 vector which contains the scaled residuals or
%               Mahalanobis distances
%               Data Types - single | double
%               psifunc.c1 = consistency factor (and other parameters)
%                   associated to required breakdown point or nominal
%                   efficiency.
%                   More precisely, psifunc.c1(1) contains consistency
%                   factor associated to required breakdown point or
%                   nominal efficiency psifunc.c1(2:end) contain other
%                   parameters associated with the rho (psi) function. 
%               Example - psifunc.class='TB';psifunc.c1=1.5476;psifunc.kc1=0.1996
%               Data Types - struct
%
%  Optional input arguments:
%
%    initialsc: scalar. The initial estimate of the scale.
%               If not defined, scaled MAD of vector |u| is used.
%               Example - 'initialsc',0.34 
%               Data Types - double
%     tol     : scalar. The tolerance for controlling convergence.
%               If not defined, tol is fixed to 1e-7.
%               Example - 'tol',1e-10 
%               Data Types - double
%     maxiter : scalar. Maximum number of iterations to find the scale.
%               If not defined, maxiter is fixed to 200.
%               Example - 'maxiter',100 
%               Data Types - double
%
%  Output:
%
%  sc : M-estimate of the scale. Scalar.
%       Robust M estimate of scale. 
%       This routine is called by Taureg.m and Sreg.m
%
% More About:
%
% u = residuals or Mahalanobis distances
% (note that u is kept fixed in each iteration).
% Remark: the M estimator of scale must satisfy the following equation
% \[
%  (1/n) \sum_{i=1}^n \rho((u_i/c)/s) = kc
% \]
%
% This routine computes the value of $s$ which satisfies the above
% equation.
%
% See also: Mscale1, minscale
%
% References:
%
% Huber P. and Ronchetti E. (2009), Robust Statistics, Wiley 
% (equation 7.119,  p. 176).
%
%
% Copyright 2008-2017.
% Written by FSDA team
%
%
%<a href="matlab: docsearchFS('Mscale')">Link to the help page for this function</a>
%
%$LastChangedDate:: 2017-11-17 15:01:40 #$: Date of the last commit
%
% Examples:

%{
    % Example of M estimate of scale.
    % M estimate of the scale using Tukey biweight rho function with a
    % value of c associated to a breakdown point of 0.5.
    psifunc=struct;
    psifunc.class='TB';
    bdp=0.5;
    c=TBbdp(bdp,1);
    % kc = E(rho) = sup(rho)*bdp
    kc=c^2/6*bdp;
    psifunc.c1=c;
    psifunc.kc1=kc;
    n=10000;
    shift=5;
    u=2*randn(n,1);
    u(1:10)=u(1:10)+shift;
    s=Mscale(u,psifunc)
%}

%{
    % Estimate of scale using Hampel rho function. 
    % M estimate of the scale using Hampel rho function with a
    % value of c associated to a breakdown point of 0.5
    psifunc=struct;
    psifunc.class='HA'
    abc=[1.5 3.5 8];
    bdp=0.5;
    c=HAbdp(bdp,1,abc);
    % kc = E(rho) = sup(rho)*bdp
    kc=HArho(c*abc(3),[c, abc])*bdp;
    psifunc.c1=[c abc];
    psifunc.kc1=kc;
    n=10000;
    shift=5;
    u=3*randn(n,1);
    u(1:10)=u(1:10)+shift;
    s=Mscale(u,psifunc)
%}

%% Beginning of code

K=0.1996;

% M-estimator of scale using the requested rho function.

if nargin<5
    maxiter = 200;
end

if nargin<4
    tol = 1e-7;
end

if nargin<3
    sc=median(abs(u))/.6745;
else
    sc=initialsc;
end

loop = 0;
err = 1;
while  (( loop < maxiter ) && (err > tol))
    % scale step: see equation 7.119 of Huber and Ronchetti, p. 176
    % scalenew = scaleold *(1/n)*\sum  \rho(u_i/scaleold) / kc
    scnew = sc*sqrt( mean(TBrho(u/sc,c)) / K);
    err = abs(scnew/sc - 1);
    sc = scnew;
    % disp(sc)
    loop = loop+1;
end
% disp(loop)
% sc=sc;
end
