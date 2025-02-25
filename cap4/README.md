# Chapter 4 The Monitoring Approach in Multiple Regression


---
Atkinson,A.C., Riani,M., Corbellini,A., Perrotta D., and Todorov,V. (2025), "Applied Robust Statistics through the Monitoring Approach: 
Applications in Regression", Heidelberg: Springer Nature.

# Abstract
 This chapter introduces algorithms for the monitoring approach to robust statistical analysis
 and compares their performance in the analyses of several sets of data. The Forward Search (FS) is introduced in section 4.1. This algorithm fits subsets of the data of increasing size in such a way that the most outlying observations are included towards the end of the search. To monitor other forms of robust regression,  we estimate the parameters using, typically, a grid of 50 values of *bdp* or *eff*.  Monitoring plots of residuals, parameter estimates and $t$-tests from very robust regression to LS are introduced in section 4.6; these plots are enriched by brushing and linking to other plots. Frequently, the plots from monitoring residuals show an abrupt change from robust to LS analyses. In section 4.7 we introduce the empirical *bdp* defining the most efficient robust estimator for each dataset, thus overcoming the arbitrariness of the conventional approach to robust statistics.  Many examples are given in section 4.9 for a variety of estimators.
 The chapter concludes in section 4.11 with a generalized Bayesian Information Criterion (BIC) for model choice which, via the mean shift outlier model, makes it possible to compare models in which different numbers of observations have been deleted. 

# YouTube videos  <img src="https://upload.wikimedia.org/wikipedia/commons/b/b8/YouTube_Logo_2017.svg" alt="YouTube Logo" width="100">


>>> [Analysis of AR regression data (Sections 3.5, 3.13 and 4.9.3)](https://youtu.be/X_P8bQABQrw)

>>> [Analysis of Hawkins data (Section 4.9.4)](https://youtu.be/Aj6-3Qyr36E)

>>>[Regression outlier detection with FS (Sections 4.1-4.5 and 4.9.5)](https://youtu.be/MMPVy7G41T8)

>>> [Analysis of Bank data (Section 4.10)](https://youtu.be/z-cCFCYiwpU)


<hr>

# Code to reproduce Figures and Tables in this Chapter





| FileName | Description | Open in MATLAB on line | Jupiter notebook | 
 |---|---|---|---| 
 |ARregression.m|AR regression data<br/> This file creates Figures 4.15-4.22|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap4//ARregression.m)| [[ipynb](ARregression.ipynb)]
|ARregressionInteractive.m|AR regression data<br/> This file creates Figures 4.12-4.14 Note that this file needs interactivity|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap4//ARregressionInteractive.m)| [[ipynb](ARregressionInteractive.ipynb)]
|Bank.m|Bank data<br/> This file creates Figure 4.34-4.42.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap4//Bank.m)| [[ipynb](Bank.ipynb)]
|BankInteractive.m|Bank data<br/> This file creates Figure 4.35 and 4.36.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap4//BankInteractive.m)| [[ipynb](BankInteractive.ipynb)]
|Hawkins.m|Hawkins data<br/> This file creates Figure 4.23 and Figures 4.27-4.29|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap4//Hawkins.m)| [[ipynb](Hawkins.ipynb)]
|HawkinsInteractive.m|Hawkins data (interactive part).<br/> This file creates Figures 4.24-4.26. Note that this file needs interactivity.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap4//HawkinsInteractive.m)| [[ipynb](HawkinsInteractive.ipynb)]
|MentalIllness.m|Contaminated illness data.<br/> This file creates Figure 4.43.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap4//MentalIllness.m)| [[ipynb](MentalIllness.ipynb)]
|Stars.m|Stars data.<br/> This file creates Figures 4.1-4.4, 4.9-4.11|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap4//Stars.m)| [[ipynb](Stars.ipynb)]
|SurgicalUnit.m|Surgical Unit data.<br/> This file creates Figures 4.30-4.33.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap4//SurgicalUnit.m)| [[ipynb](SurgicalUnit.ipynb)]
|Wool.m|Wool data.<br/> This file creates Figures 4.5-4.8.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap4//Wool.m)| [[ipynb](Wool.ipynb)]
