# Chapter 8: Extensions of the Multiple Regression Model


---
Atkinson,A.C., Riani,M., Corbellini,A., Perrotta D., and Todorov,V. (2025), "Applied Robust Statistics through the Monitoring Approach: 
Applications in Regression", Heidelberg: Springer Nature.

# Abstract
The chapter explores five extensions to the regression model considered in earlier chapters. Section 8.1 introduces the use of prior knowledge in regression analysis, including the construction of prior distributions from fictitious observations. In section 8.2 Bayesian regression is combined with the FS.  Section 8.3 provides analyses of successive annual sets of  trade data, in which the prior distribution is updated annually. Heteroskedastic regression is introduced in section 8.4. The analysis of trade data makes clear the importance of avoiding models in which the variance goes to zero as $x$ does. Section 8.5 extends the analysis of trade data  to data from several regression lines. The number of groups  is estimated in section 8.5.2  from an FS which starts the search many times from random  points. Regression clustering (section 8.5.3) involves the choice of  parameters and, for robustness, a choice of  trimming level.  The monitoring approach in section 8.5.4 identifies solutions which do not depend on arbitrary choices of these hyper-parameters.  The fourth extension, in section 8.6, is to use monitoring to provide a robust model for short term economic time series that may have strong annual trends. The final extension, in section 8.7, is to regression in which the explanatory variables are the components of a composition.


# YouTube videos  <img src="https://upload.wikimedia.org/wikipedia/commons/b/b8/YouTube_Logo_2017.svg" alt="YouTube Logo" width="100">

>>> <a href="https://youtu.be/Op_yXrdhiDg?si=RVkitOUWg5EAGRuu"> Robust Bayesian regression (Sections 8.1- 8.3) </a>

>>> <a href="https://youtu.be/QLnSTc5g19A?si=tP0L3BwOLrvUypxX"> Heteroskedastic regression (Section 8.4) </a>

# Code to reproduce Figures and Tables in this Chapter

For each chapter of the book we have given for each file the original source .m file and the corresponding .ipynb file.
The .m file (**after installing [FSDA](https://www.mathworks.com/matlabcentral/fileexchange/72999-fsda)**) can be run on your MATLAB desktop or in MATLAB Online (please see the button Open in MATLAB Online below).
The .ipynb is given in order to show you the output of the code.
In order to run the .ipynb files inside jupiter notebook follow the instructions in the file [ipynbRunInstructions.md](../ipynbRunInstructions.md). 


| FileName | Description | Open in MATLAB on line | Jupiter notebook | 
 |---|---|---|---| 
 |comp_FishMorph.m|Fish Morphology data.<br/> This file creates Figures 8.36-8.39|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap8//comp_FishMorph.m)| [[ipynb](comp_FishMorph.ipynb)]
|comp_ValueAdded_AddedT.m|Value added data: monitoring tstat<br/> This file creates Figure 8.34|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap8//comp_ValueAdded_AddedT.m)| [[ipynb](comp_ValueAdded_AddedT.ipynb)]
|comp_ValueAdded_Ini.R|Value added data: tolerance ellipses and ternary diagrams<br/> This file creates Figure 8.33|[Open](comp_ValueAdded_Ini.R)
|comp_ValueAdded_MMreg.R|Value added data: MM-regression<br/> This file creates Figure 8.35, Table 8.3 and Table 8.4|[Open](comp_ValueAdded_MMreg.R)
|facemasks.m|Facemasks data<br/> Facemasks: 352 imports of FFP2 and FFP3 masks (product 6307909810) into the European Union extracted in a day of November. This file creates Figures 8.19-8.20, 8.22, 8.26-8.29.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap8//facemasks.m)| [[ipynb](facemasks.ipynb)]
|facemasks_BIC.R|Facemask data: BIC traditional analsys<br/> This file creates Figures 8.24 and 8.25|[Open](facemasks_BIC.R)
|facemasksInteractive.m|Facemasks data: interactive part.<br/> This file creates Figures 8.21 and 8.23|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap8//facemasksInteractive.m)| [[ipynb](facemasksInteractive.ipynb)]
|HousePrice.m|Windsor House Price data.<br/> This file creates Figures 8.1-8.7.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap8//HousePrice.m)| [[ipynb](HousePrice.ipynb)]
|InternationalTrade1.m|Heteroskedasticity: International Trade Data 2.<br/> This file creates Figures 8.12-8.15.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap8//InternationalTrade1.m)| [[ipynb](InternationalTrade1.ipynb)]
|InternationalTrade2.m|Heteroskedasticity: International Trade Data 2.<br/> This file creates Figures 8.16 and 8.18. File which creates Figure 8.17 is called InterenationalTrade2Interactive.m|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap8//InternationalTrade2.m)| [[ipynb](InternationalTrade2.ipynb)]
|InternationalTrade2Interactive.m|Heteroskedasticity: International Trade Data 2 (interactive plot).<br/> This file creates Figure 8.17. File which creates Figures 8.16 and 8.18 is called InternationalTrade2.m|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap8//InternationalTrade2Interactive.m)| [[ipynb](InternationalTrade2Interactive.ipynb)]
|timeseries_analysis.m|Robust monitoring of time series<br/> This file creates Figures 8.30-8.32.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap8//timeseries_analysis.m)| [[ipynb](timeseries_analysis.ipynb)]
|Lobster2002_2004.m|Lobster dataset years 2002-2004.<br/> This file creates Figures 8.8-8.11.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap8//Lobster2002_2004.m)| [[ipynb](Lobster2002_2004.ipynb)]
