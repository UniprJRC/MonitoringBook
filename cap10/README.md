# Chapter 10 Some Robust Data Analyses


---
Atkinson,A.C., Riani,M., Corbellini,A., Perrotta D., and Todorov,V. (2025), "Applied Robust Statistics through the Monitoring Approach: 
Applications in Regression", Heidelberg: Springer Nature.

# Abstract
In this last chapter, we exhibit the power of the methods described earlier, by analysing five datasets. We start in section 10.2 with the two sets of income data from section 1.4. Without explanatory variables  we found the log transformation for the former, while the analysis of the latter remained inconclusive. When explanatory variables are included, and outliers deleted, the square-root transformation is indicated for both. In section 10.4  we analyse 1711 responses to a survey on customer loyalty, 
in which there are six explanatory variables. Parametric methods lead to $\sqrt{y}$ as the response, 
the identification of 41 outliers and a skewed distribution of residuals. 
RAVAS followed by the FS provides a good approximation to normally distributed errors, when only 
nine observations are deleted.
This analysis is summarized in tabular form in section 10.4.6 to provide a template for modern robust analysis of regression data. 
Despite transformation and outlier detection, 
the $t$-statistics for the significance of the variables hardly change. Accordingly, in section 10.5  we modify 25 observations: monitoring plots reveal the  outliers and the results of the RAVAS analysis are close to those for the uncontaminated data. Finally, we analyse  the ``NCI-60`` cancer cell  data (Chapter 9).
With only seven explanatory variables, we monitor LS diagnostics, detect outliers and  apply RAVAS, which gives the best fitting model. The generalized candlestick plot provides further model selection. 



# YouTube videos  <img src="https://upload.wikimedia.org/wikipedia/commons/b/b8/YouTube_Logo_2017.svg" alt="YouTube Logo" width="100">

>>> [Analysis of the Income data 1 (Section 10.2)](https://youtu.be/wj3k2-Ca-f4)

>>> [Analysis of the Income data 2 (Section 10.3)](https://youtu.be/6EF3Nk1yzTE)

>>> [Analysis of the customer loyalty data (Section 10.4)](https://youtu.be/0mVbMqh99_4)

>>> [Analysis of the modified customer loyalty data (Section 10.5)](https://youtu.be/YT8exrmVpdg)

>>> [Analysis of the NCI 60 cancer cell panel data (Section 10.6)](https://youtu.be/1RF3wj1Ml8Y)

<hr>

# Code to reproduce Figures and Tables in this Chapter




| FileName | Description | Open in MATLAB on line | Jupiter notebook | 
 |---|---|---|---| 
 |CustomerLoyalty.m|Customer Loyalty data<br/> This file creates Figures 10.22-10.36 and Tables 10.5-10.6. Figures 10.22 and 10.24 are created in a non interactive way. In order to create them interactively, please use file CustomerLoyaltyInteractive.m|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap10//CustomerLoyalty.m)| [[ipynb](CustomerLoyalty.ipynb)]
|CustomerLoyaltyInteractive.m|This file is referred to dataset Customer Loyalty<br/> This is just the interactive part It creates Figures 10.22 and 10.24 The file which creates all the Figures and for this dataset is called CustomerLoyalty.m|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap10//CustomerLoyaltyInteractive.m)| [[ipynb](CustomerLoyaltyInteractive.ipynb)]
|CustomerLoyaltyModified.m|Modified Customer Loyalty data.<br/> This file creates Figures 10.37-10.46 and Table 10.7.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap10//CustomerLoyaltyModified.m)| [[ipynb](CustomerLoyaltyModified.ipynb)]
|CustomerLoyaltyModifiedInteractive.m|Modified Customer Loyalty dataset (interactive part).<br/> It creates Figures 10.37 ---- 10.46 and Table 10.7|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap10//CustomerLoyaltyModifiedInteractive.m)| [[ipynb](CustomerLoyaltyModifiedInteractive.ipynb)]
|Income1Regression.m|Regression analysis of dataset Income1.<br/> This file creates Figures 10.1-10.11 and Table 10.1|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap10//Income1Regression.m)| [[ipynb](Income1Regression.ipynb)]
|Income2regression.m|Regression analysis of dataset Income2.<br/> This file creates Figures 10.12-10.21 and Tables 10.2-10.4.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap10//Income2regression.m)| [[ipynb](Income2regression.ipynb)]
|NCI60.m|NCI 60 Cancer Cell Panel Data.<br/> This file creates Figures 10.47-10.62 and Tables 10.8-10.10.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/FigMonitoringBook&file=cap10//NCI60.m)| [[ipynb](NCI60.ipynb)]
