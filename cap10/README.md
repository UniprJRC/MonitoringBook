# Chapter 10 Some Robust Data Analyses


---
Atkinson,A.C., Riani,M., Corbellini,A., Perrotta D., and Todorov,V. (2023), Applied Robust Statistics through the Monitoring Approach, Heidelberg: Springer Nature.

# Abstract
 In this last chapter, we exhibit the power of the methods described earlier, by analysing five datasets. We start in \S\ref{cap10:ID1} with the two sets of income data from \S\ref{cap1:datTRR}. Without explanatory variables  we found the log transformation for the first, with the analysis of the second  inconclusive. When explanatory variables are included, and outliers deleted, the square-root transformation is indicated for both. In \S\ref{cap10:customerloyalty} we analyse 1711 responses to a survey on customer loyalty, in which there are six explanatory variables. Parametric methods lead to $\surd{y}$ as the response, the identification of 41 outliers and a skewed distribution of residuals. RAVAS followed by the FS provides a good approximation to normally distributed errors, when only nine observations are deleted. Despite transformation and outlier detection, the $t$-statistics for the significance of the variables hardly change. Accordingly, in \S\ref{cap10:modifiedloyaltd} we modify 25 observations: monitoring plots reveal the  outliers and the results of the RAVAS analysis are close to those for the uncontaminated data.   Finally, we analyse  the NCI-60 cancer cell  data (Chapter~\ref{CAP9lab}).
With only seven explanatory variables, we
monitor LS diagnostics, detect outliers and  apply RAVAS, which gives the
best fitting model. The generalized candlestick plot provides further model selection. 


# Code to reproduce Figures and Tables in this Chapter




| FileName | Description | Open in MATLAB on line | Jupiter notebook | 