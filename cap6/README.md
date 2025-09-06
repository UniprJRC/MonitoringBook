# Chapter 6 Transformations


---
Atkinson,A.C., Riani,M., Corbellini,A., Perrotta D., and Todorov,V. (2023), "Applied Robust Statistics through the Monitoring Approach: 
Applications in Regression", Heidelberg: Springer Nature.

# Abstract
For observations from a known distribution, the variance stabilizing transformation yields approximately normally distributed transformed variables. For data, the Box-Cox family of power transformations, indexed by a parameter $\lambda$, provides a widely applicable method for transformation of positive response data to approximate normality. The chapter describes procedures for making the transformation robust and extending the robustness to more general problems.
  An approximate score test for the null value  $\lambda_0$ is developed in section 6.1.2. A significant value leads to rejection of the value $\lambda_0$. Using the FS to monitor the score test for a set of values of $\lambda_0$ leads in section 6.1.3 to the "Fan Plot". This reveals the effect of outliers on the estimated transformation and so to the deletion of outliers and selection of a value of $\lambda$ for further data analysis. Section 6.2 develops related procedures (the extended Yeo-Johnson transformation) for data which can be positive or negative.
The approach is visual, being based on the interpretation of fan plots. Section 6.3 provides an automatic procedure for estimating these transformations  using quantities calculated from fan plots.  Transformation procedures  when the responses are proportions or percentages follow, as well as transformations of both sides of a statistical model.

# YouTube videos  <img src="https://upload.wikimedia.org/wikipedia/commons/b/b8/YouTube_Logo_2017.svg" alt="YouTube Logo" width="100">

>>> <a href="https://youtu.be/KOPYSeNgKPM?si=Ealxz6k738mmp0Oy"> Transformation of the response </a>


# Code to reproduce Figures and Tables in this Chapter




| FileName | Description | Open in MATLAB on line | Jupiter notebook | 
 |---|---|---|---| 
 |BalanceSheets.m|Balance sheets data.<br/> This file creates Figure 6.12-6.13 and Table 6.2.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap6//BalanceSheets.m)| [[ipynb](BalanceSheets.ipynb)]
|BalanceSheetsInteractive.m|Balance sheets data<br/> This file creates Figure 6.14|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap6//BalanceSheetsInteractive.m)| [[ipynb](BalanceSheetsInteractive.ipynb)]
|InvestmentFunds.m|Investment Funds data.<br/> This file creates Figures 6.8-6.11 and Table 6.1.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap6//InvestmentFunds.m)| [[ipynb](InvestmentFunds.ipynb)]
|LoyaltyCards.m|Loyalty cards data<br/> This file creates Figures 6.2-6.6. Note that: Figures 6.15-6.16 are created by file LoyaltyCardsBICplots.m|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap6//LoyaltyCards.m)| [[ipynb](LoyaltyCards.ipynb)]
|LoyaltyCardsBICplots.m|Loyalty cards data.<br/> This file creates Figures 6.15-6.16. Note that Figures 6.2-6.6 are created by file LoyaltyCards.m.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap6//LoyaltyCardsBICplots.m)| [[ipynb](LoyaltyCardsBICplots.ipynb)]
|Mandible.m|Mandible Length data.<br/> This file creates Figure 6.17.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap6//Mandible.m)| [[ipynb](Mandible.ipynb)]
|MentalIllness.m|Mental Illness data.<br/> This file creates Figure 6.7.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap6//MentalIllness.m)| [[ipynb](MentalIllness.ipynb)]
|SurgicalUnitFanplot.m|Surgical Unit data.<br/> This file creates Figure 6.1.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap6//SurgicalUnitFanplot.m)| [[ipynb](SurgicalUnitFanplot.ipynb)]
