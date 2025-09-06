# Chapter 9 Model selection


---
Atkinson,A.C., Riani,M., Corbellini,A., Perrotta D., and Todorov,V. (2025), "Applied Robust Statistics through the Monitoring Approach: 
Applications in Regression", Heidelberg: Springer Nature.

# Abstract
This chapter considers the choice of explanatory variables to include in the linear predictor $x^T\beta$. We start with models for all of which $p$, the dimension of $\beta$, is $p < n$. The problem arises specifically when some variables are nearly collinear when the significance of a variable in the model may depend strongly on what other  variables are included. Section 9.3.1 derives Mallow's $C_p$  from Akaike's AIC; models with more parameters are penalized. Robustness is provided by the generalized candlestick plot, illustrated by three data analyses. For the rest of the chapter we take $n < p$.
Section 9.4.1 describes two regularizations: the LASSO estimates $\beta$ as the minimizer of a linear combination of the $L_2$ norm of the residuals and the $L_1$ norm of the parameter estimates. The method provides model selection, the number of parameter estimates set to zero depending on a  parameter $\lambda$. In ridge regression both terms use the $L_2$ norm, the parameter $\lambda$ controlling the shrinkage of the parameter estimates. Neither method is robust. Section 9.4.2  describes sparse LTS which adds an $L_1$ penalty term with penalty parameter $\lambda$ to  LTS estimation. In 9.4.3 the parameter $\lambda$ is estimated, for the cancer data of 9.4.1, by monitoring. Seven explanatory variables occur in many of the selected models. These are subjected to robust model selection in section 10.6.


# YouTube videos  <img src="https://upload.wikimedia.org/wikipedia/commons/b/b8/YouTube_Logo_2017.svg" alt="YouTube Logo" width="100">

>>> <a href="https://youtu.be/xFNGnEgDam4?si=l5WOOcGj6L4Hy9u-"> Variable Selection Mallow's Cp and the generalized candlestick plot (Section 9.3) </a>

# Code to reproduce Figures and Tables in this Chapter


| FileName | Description | Open in MATLAB on line | Jupiter notebook | 
 |---|---|---|---| 
 |Cement.m|Cement data.<br/> This file creates Tables 9.1 and 9.2.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap9//Cement.m)| [[ipynb](Cement.ipynb)]
|NCI60sparseLTS.R|NIC60 data:  Least Absolute Shrinkage and Selection Operator (LASSO)<br/> This file creates Figures 9.3, 9.4, 9.5, 9.6 and 9.7.|[Open](NCI60sparseLTS.R)
|Ozone.m|Ozone data (reduced and full).<br/> This file creates Figures 9.1 and 9.2|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap9//Ozone.m)| [[ipynb](Ozone.ipynb)]
