n=100;
p=3;
y=randn(n,1);
X=randn(n,p);
s=randsample(n,p);
Xb=X(s,:);
yb=y(s);
initialbeta=Xb\yb;

% Residuals for the initialbeta
r = y - X * initialbeta;

h=n/2;

% Squared residuals for all the observations
r2 = r.^2;

% Ordering of squared residuals
[r2s , IX] = sort(r2);
initialscale  = sum(r2s(1:h));
disp(initialscale)

% Initialize parameters for the refining steps loop
iter        = 0;
betadiff    = 9999;
beta        = initialbeta;
scale       = Inf;
reftol      =1e-15;
refsteps    =50;

while ( (betadiff > reftol) && (iter < refsteps) )
    iter = iter + 1;
    
    % IX= indexes of the units with smallest h squared residuals
    IX = IX(1:h);
    % new coefficients based on units with smallest h squared
    % residuals
    newbeta = X(IX,:) \ y(IX);
    
    % exit from the loop if the new beta has singular values. In such a
    % case, any intermediate estimate is not reliable and we can just
    % keep the initialbeta and initial scale.
    if (any(isnan(newbeta)))
        newbeta = initialbeta;
        scale = initialscale;
        break
    end
    
    % betadiff is linked to the tolerance (specified in scalar reftol)
    betadiff = norm(beta - newbeta,1) / norm(beta,1);
    
    % update residuals
    r = y - X * newbeta;
    % Ordering of all new squared residuals
    [r2s , IX] = sort(r.^2);
    % sum of the smallest new squared residuals
    scale = sum(r2s(1:h));
    disp(['Iteration ' num2str(iter) ' Scale estimate=' num2str(scale,10)])
    % update beta
    beta = newbeta;
    
end