# Chapter 5 Robust Estimators in Multiple Regression


---
Atkinson,A.C., Riani,M., Corbellini,A., Perrotta D., and Todorov,V. (2025), "Applied Robust Statistics through the Monitoring Approach: 
Applications in Regression", Heidelberg: Springer Nature.

# Abstract

Results for small $n$ and moderate $p$ show that the size and power of robust tests of regression models can be far from the nominal asymptotic values. This chapter uses simulation to investigate the properties of outlier tests  for moderate sample sizes. Section 5.1 compares the size of outlier tests for 30 very robust estimators, which leads to the selection of five  estimators for comparison  in the next sections: S, MM, LTS and LTSr, the reweighted LTS estimator, together with FS. Section 5.2 compares the sizes of the five test for $n$ from 100 to 1,000 and section 5.3 compares the average  power (the proportion of outliers correctly identified) over a range of values of the outlier shift.  Section 5.4 describes a parametric framework for comparing robust regression estimators. In this a set of outliers is moved along some trajectory in $y,X$ space and the effect on inferences calculated; typically bias and variance of parameter estimates and average power. In all these comparisons all estimators, apart from FS, have fixed, very robust, settings. Monitoring the comparisons is provided in section 5.6 by using the extended BIC (section 4.11) to determine the robustness level at which the properties of the various estimators are assessed.

# Code to reproduce Figures and Tables in this Chapter



| FileName | Description | Open in MATLAB on line | Jupiter notebook | 
 |---|---|---|---| 
 |BICSimulFigures.m|Distribution of BIC<br/> Create Figures 5.23 and 5.24, 5.25 and 5.26 Confidence bands with 10 per cent contamination Simulation results have been created by file BICSimul1.m and BICsimul2.m n=200 p=5;|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap5//BICSimulFigures.m)| [[ipynb](BICSimulFigures.ipynb)]
|Effect_Size.m|Size comparison<br/> This file creates Figures 5.5-5.6 Note that nsimul is set to 100. If you wish to use 10000 simulations (as done in the book) set nsimul to 10000|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap5//Effect_Size.m)| [[ipynb](Effect_Size.ipynb)]
|EmpSizeOutliersTest.m|Empirical size of outlier tests,<br/> This file creates Figures 5.1-5.4 Note that nsimul is set to 100. If you wish to use 10000 simulations (as done in the book) set nsimul to 10000|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap5//EmpSizeOutliersTest.m)| [[ipynb](EmpSizeOutliersTest.ipynb)]
|Parameterized_Family_Departures.m|Power comparison<br/> This file creates Figures 5.13, 5.14, 5.15, 5.16, 5.17, 5.18, 5.19, 5.20, 5.21, 5.22.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap5//Parameterized_Family_Departures.m)| [[ipynb](Parameterized_Family_Departures.ipynb)]
|Power_Comparison.m|Power comparison<br/> This file creates Figures 5.7-5.12 Note that nsimul is set to 100. If you wish to use 10000 simulations (as done in the book) set nsimul to 10000|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap5//Power_Comparison.m)| [[ipynb](Power_Comparison.ipynb)]
|TwoMorePopulationsSection57.m|International trade data<br/> This file creates Figures 5.27 and 5.28|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap5//TwoMorePopulationsSection57.m)| [[ipynb](TwoMorePopulationsSection57.ipynb)]
|tab_5_3.m|Theoretical size<br/> This file creates theretical parts of Tables 5.2 and 5.3|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap5//tab_5_3.m)| [[ipynb](tab_5_3.ipynb)]
