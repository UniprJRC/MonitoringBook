# Chapter 1 Introduction and the Grand Plan


---
Atkinson,A.C., Riani,M., Corbellini,A., Perrotta D., and Todorov,V. (2025), "Applied Robust Statistics through the Monitoring Approach: 
Applications in Regression", Heidelberg: Springer Nature.

# Abstract

 Robust statistical methods  provide understanding of suitable models for data that are contaminated by systematic or random departures. A discussion of the `The Grand Plan' for robust statistics provides a historical context. We start robust data analysis with an introduction to estimates of location, introducing the ideas of breakdown point *bdp*, the proportion of outlying observations that a particular robust analysis can be expected to adjust for, and of the asymptotic relative efficiency *eff*, how much information is lost by the robust procedure if the data are not contaminated. As one measure increases, the other decreases. We also introduce robust estimates of scale. In the traditional robust approach, analyses are usually made for one value of *bdp* or *eff*.  Our book focuses on the monitoring approach to robust statistics in which analyses are performed over a range of values of $bdp$ and *eff*.  For some simple examples, including the transformation of income data, we compare the information obtained from the traditional static and the monitoring approaches, the latter providing extra insights into the data. The Grand Plan for the wider application  of robust procedures can be realised through the Monitoring Approach, leading to appreciably more effective  data analyses.

# YouTube videos  <img src="https://upload.wikimedia.org/wikipedia/commons/b/b8/YouTube_Logo_2017.svg" alt="YouTube Logo" width="100">

>>> <a href="https://youtu.be/jSLNEa5VTN4?si=bPYYXl1pqrdHu2Jt"> Introduction and the Grand Plan </a>
<br>

# Code to reproduce Figures and Tables in this Chapter


For each chapter of the book we have given for each file the original source .m file and the corresponding .ipynb file.
The .m file (**after installing [FSDA](https://www.mathworks.com/matlabcentral/fileexchange/72999-fsda)**) can be run on your MATLAB desktop or in MATLAB Online (please see the button Open in MATLAB Online below).
The .ipynb is given in order to show you the output of the code.
In order to run the .ipynb files inside jupiter notebook follow the instructions in the file [ipynbRunInstructions.md](../ipynbRunInstructions.md). 




| FileName | Description | Open in MATLAB on line | Jupiter notebook | 
 |---|---|---|---| 
 |Income1Univariate.m|Univariate analysis of the response for dataset Income1.<br/> This file creates Figures 1.2 ----- 1.5 and Tables 1.1, 1.2.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap1//Income1Univariate.m)| [[ipynb](Income1Univariate.ipynb)]
|Income2Univariate.m|Univariate analysis of the response for dataset Income2.<br/> This file creates Figure 1.6 and Tables 1.3, 1.4|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap1//Income2Univariate.m)| [[ipynb](Income2Univariate.ipynb)]
|MADsmallsample.m|Analysis of consistency factor (small sample and asymptotic for MAD).<br/> This file creates Figure 1.1|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap1//MADsmallsample.m)| [[ipynb](MADsmallsample.ipynb)]
