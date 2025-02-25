# Chapter 2 Introduction to M-Estimation for Univariate Samples


---
Atkinson,A.C., Riani,M., Corbellini,A., Perrotta D., and Todorov,V. (2024), "Applied Robust Statistics through the Monitoring Approach: 
Applications in Regression", Heidelberg: Springer Nature.

# Abstract

 The purpose of this chapter is to introduce and discuss the tools, such as the influence function, used to evaluate the properties of the various estimators of location and scale in univariate samples. We focus on M-estimators, that is estimators of maximum  likelihood type, in which the estimating equations for least squares are modified by a $\rho$ function that downweights large residuals. We consider the estimation of location and scale and the simultaneous estimation of both parameters and provide algorithms.  In 2.3.2  we show the properties of the $\rho$ functions and their derivatives, which are important in the algorithms for estimation; all functions depend on parameters which specify the resulting values of *bdp* and *eff*. In 2.4.1.1  we compare the estimators in terms of *bdp* and *eff*, varying the parameters. These asymptotic calculations of *bdp* and *eff* for the estimators show that, because of the relationship between the two properties, there is surprisingly little difference between the performance of the $\rho$ functions. The chapter concludes with some small-sample comparisons of the estimators and consideration of multiple solutions to numerical algorithms for parameter estimation



>>> <a href="https://youtu.be/4wP0rbELIjE?si=XETW6XZM5HlIPu4o"> Introduction to M-Estimation for Univariate Samples PART I <img src="https://upload.wikimedia.org/wikipedia/commons/b/b8/YouTube_Logo_2017.svg" alt="YouTube Logo" width="100"></a>

>>>  <a href="https://youtu.be/g_mvTRs4LjY?si=4s4folepyrN5nJ1v"> Introduction to M-Estimation for Univariate Samples PART II <img src="https://upload.wikimedia.org/wikipedia/commons/b/b8/YouTube_Logo_2017.svg" alt="YouTube Logo" width="100"></a>
<br>


# Code to reproduce Figures and Tables in this Chapter




| FileName | Description | Open in MATLAB on line | Jupiter notebook | 
 |---|---|---|---| 
 |Income1MultipleSolutions.m|Example to show the issue of multiple solutions problem with redescending psi functions.<br/> This file creates Figure 2.28.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap2//Income1MultipleSolutions.m)| [[ipynb](Income1MultipleSolutions.ipynb)]
|Income1SensitivityCurve.m|Sensistivity curve for the Income data.<br/> This file creates Figure 2.1.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap2//Income1SensitivityCurve.m)| [[ipynb](Income1SensitivityCurve.ipynb)]
|InfluenceFunctionN01.m|Influence Function at N(0,1) for different estimators.<br/> This file creates Figure 2.2.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap2//InfluenceFunctionN01.m)| [[ipynb](InfluenceFunctionN01.ipynb)]
|SmallSampleComparisons.m|Small sample comparison of different link functions<br/> This file creates Figures 2.22 - 2.27.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap2//SmallSampleComparisons.m)| [[ipynb](SmallSampleComparisons.ipynb)]
|areNormT.m|Compute empirical and theoretical ARE(med, Mean) under the normal distribution and the Student t.<br/> This file creates Figure 2.3.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap2//areNormT.m)| [[ipynb](areNormT.ipynb)]
|areVarComparison.m|Variance comparison under the contamination model.<br/> This file creates Figure 2.4.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap2//areVarComparison.m)| [[ipynb](areVarComparison.ipynb)]
|bdpeffRhoFuncCompare5.m|Comparison of rho functions in terms of bdp.<br/> This file creates Figures 2.14 and 2.15.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap2//bdpeffRhoFuncCompare5.m)| [[ipynb](bdpeffRhoFuncCompare5.ipynb)]
|bdpeffRhoFuncPD.m|Breakdown point and efficiency for PD link.<br/> This file creates Figure 2.13.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap2//bdpeffRhoFuncPD.m)| [[ipynb](bdpeffRhoFuncPD.ipynb)]
|compareIFlocation.m|Compare IF of different location estimators (use bdp=0.5 or eff=0.95).<br/> This file creates Figures 2.16 and 2.17.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap2//compareIFlocation.m)| [[ipynb](compareIFlocation.ipynb)]
|compareIFscale.m|Compare IF of different scale estimators (use bdp=0.5 or eff=0.95).<br/> This file creates Figures 2.18 and 2.19.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap2//compareIFscale.m)| [[ipynb](compareIFscale.ipynb)]
|comparePsiderfunctions.m|Compare derivatives of psi functions (use bdp=0.5 or eff=0.95).<br/> This file creates Figures 2.20 and 2.21 and Table 2.2|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap2//comparePsiderfunctions.m)| [[ipynb](comparePsiderfunctions.ipynb)]
|compareWfunctions.m|Compare weight functions using bdp=0.5 or eff=0.95.<br/> This file creates Figure 2.11 and 2.12.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap2//compareWfunctions.m)| [[ipynb](compareWfunctions.ipynb)]
|rhoHampel.m|Details of Huber link for different values of c.<br/> This file creates Figure 2.7.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap2//rhoHampel.m)| [[ipynb](rhoHampel.ipynb)]
|rhoHuber.m|Details of Huber link for different values of c.<br/> This file creates Figures 2.5 and 2.6.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap2//rhoHuber.m)| [[ipynb](rhoHuber.ipynb)]
|rhoHyper.m|Details of hyperbolic link for different values of c.<br/> This file creates Figure 2.9.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap2//rhoHyper.m)| [[ipynb](rhoHyper.ipynb)]
|rhoPowerDivergence.m|Details of PD link for different values of alpha.<br/> This file creates Figure 2.10.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap2//rhoPowerDivergence.m)| [[ipynb](rhoPowerDivergence.ipynb)]
|rhoTukey.m|Details of TB link for different values of c.<br/> This file creates Figure 2.8.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap2//rhoTukey.m)| [[ipynb](rhoTukey.ipynb)]
