# Chapter 7 Non-parametric Regression


---
Atkinson,A.C., Riani,M., Corbellini,A., Perrotta D., and Todorov,V. (2025), "Applied Robust Statistics through the Monitoring Approach: 
Applications in Regression", Heidelberg: Springer Nature.

# Abstract
 Unlike Chapter 6, this chapter focuses on non-parametric transformations of both the response and the explanatory variables. Transformation of the explanatory variables uses the Generalized Additive Model (GAM), described in Section 7.2. The transformation of the response iteratively applies the variance stabilizing transformation to residuals from the fitted GAM. The algorithm developed, which we call RAVAS, is a robust version of Tibshirani's AVAS  (Additivity and VAriance Stabilization).  The developments are presented as a series of options written in pseudo-code. In addition to robustness, three options use initial manipulation of the data to improve convergence of the back-fitting algorithm for the GAM. Section 7.4.8 introduces an improved procedure for the variance stabilizing transformation (option ``trapezoid``), a detailed description of which is in Section 7.4.9.  Section 7.5 uses simulations to illustrate the important improvement provided by this option, whether robustness is chosen or not. Section 7.6  introduces a  graphical procedure, the augmented star plot, which indicates which combinations of options lead to satisfactory models. The chapter closes with further data analyses, comparisons of AVAS and RAVAS and with references to some of the literature on non-parametric regression.


# YouTube videos  <img src="https://upload.wikimedia.org/wikipedia/commons/b/b8/YouTube_Logo_2017.svg" alt="YouTube Logo" width="100">


>>> <a href="https://youtu.be/Q7D3HioOxHQ?si=iC5gNyOYEvtOlkbp"> Non parametric transformations (part I) </a>

>>> <a href="https://youtu.be/bvOWwGmxRko?si=m0FtPkrlU4ctTizY"> Non parametric transformations (part II) </a>


# Code to reproduce Figures and Tables in this Chapter





| FileName | Description | Open in MATLAB on line | Jupiter notebook | 
 |---|---|---|---| 
 |Example1.m|Example 1 (Section 7.5.1).<br/> This file creates Figures 7.4 and 7.5|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap7//Example1.m)| [[ipynb](Example1.ipynb)]
|Example2.m|Example 2, 4 explanatory variables (section 7.5.2).<br/> This file creates Figures 7.10-7.12|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap7//Example2.m)| [[ipynb](Example2.ipynb)]
|ExampleWangMurphy.m|Example from Wang and Murphy<br/> This file creates Figures 7.13-7.15|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap7//ExampleWangMurphy.m)| [[ipynb](ExampleWangMurphy.ipynb)]
|Fish.m|Fish data.<br/> This file creates Figures 7.16-7.19.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap7//Fish.m)| [[ipynb](Fish.ipynb)]
|Marketing.m|Internet Marketing Data<br/> This file creates Figures 7.20-7.24|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap7//Marketing.m)| [[ipynb](Marketing.ipynb)]
|SimStudyFigures.m|Simulation study to compare RAVAS with AVAS<br/> This file creates Figures 7.25 and 7.26.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap7//SimStudyFigures.m)| [[ipynb](SimStudyFigures.ipynb)]
|TwoVariableModel.m|Two variable model (section 7.5.2).<br/> This file creates Figures 7.6-7.9.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap7//TwoVariableModel.m)| [[ipynb](TwoVariableModel.ipynb)]
|VarianceStabilizingTransformation.m|Variance stabilizing transformation.<br/> This file creates Figures 7.1-7.3.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap7//VarianceStabilizingTransformation.m)| [[ipynb](VarianceStabilizingTransformation.ipynb)]
