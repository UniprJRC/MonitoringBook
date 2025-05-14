%% Example of robust estimate of location

y=[28 26 33 24 34 -44 27 16 40 -2 ...
    29 22 24 21 25 30 23 29 31 19];
y=y';
y=[y;-44*ones(3,1)];

boxplot(y)

%% Beginning of iterative loop
mady=mad(y,1)/0.675;
% mady=6.8792;
% mady=6.9493;
% mady=stats.mad_s

tukey=true;

% Initialize with the median
oldloc=median(y);
% try to initialize with a different value
% oldloc=-100;

% Set the tolerance
tol=1e-7;

% Set maximum number of iterations
niter=100;

% Define tuning constant
if tukey==true
    c=4.685;
else
    c=1.5476;
end

% Start the iterative loop
for i=1:niter

    % Find the weigths given oldloc, mady and c
    if tukey == true
        wei=TBwei((y-oldloc)/mady,c);
    else
        wei=HUwei((y-oldloc)/mady,c);
    end

    % Find new estimate of location
    newloc= sum(wei.*y)/sum(wei);

    % Display
    disp(['Iteration n.' num2str(i)   ' Diff= ' num2str(abs(newloc-oldloc))])

    % If the difference between old and new estimate of location is smaller
    % than tol get out of the loop
    if abs(newloc-oldloc)<tol
        break
    else
        oldloc=newloc;
    end
end
% Show the value of robust estimate of location
disp(['Robust estimate of location= '  num2str(newloc)])

%% Robust estimate of location using function robustfit of MATLAB
X=ones(length(y),1);
if tukey==true
    % Robust estimate of location using bisquare
    [RobLoc,stats]=robustfit(X,y,'bisquare',c,'off');
else
    % Robust estimate of location using huber
    [RobLoc,stats]=robustfit(X,y,'huber',c,'off');
end
% MAD used by MATLAB inside iteration is
% stats.mad_s
disp('Robust estimate of location based on MATLAB function robustfit')
disp(RobLoc)


