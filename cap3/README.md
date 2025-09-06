# Chapter 3 Robust Estimators in Multiple Regression


---
Atkinson,A.C., Riani,M., Corbellini,A., Perrotta D., and Todorov,V. (2025), "Applied Robust Statistics through the Monitoring Approach: 
Applications in Regression", Heidelberg: Springer Nature.

# Abstract

The first five sections describe multiple regression with least squares, including methods for outlier detection. Section 3.6 introduces three distinct approaches to robust regression: (i) soft trimming, or downweighting, which extends the M-estimation of Chapter 2 to regression, principally S-estimation (Section 3.8); (ii) hard trimming, Least Trimmed Squares (LTS, Section 3.11) in which a specified proportion of the observations is trimmed and (iii) adaptive hard trimming, the Forward Search (FS, Section 4.1). This monitoring method is explored more thoroughly in Chapter 4. Unlike the FS, the methods in (i) and (ii) provide a single robust analysis under chosen specified conditions. That for  LTS depends on the chosen trimming proportion, which should, hopefully,  trim all outliers and fit the model to all the uncontaminated data. For the downweighting methods in (i) the severity of downweighting is determined by the choice of tuning constants to give desired robustness properties. The calculations are described in Section 3.9. The algorithm for S-estimation is in section 3.10 with that for LTS in Section 3.11.1. Further developments of M-estimation (MM- and $\tau$-estimators) are described in 3.12,1 and 3.12.2. Reweighted LTS estimators are introduced in 3.12.3. Section 3.13 concludes the chapter with comparisons of traditional robust data analyses for a single specified target of robustness.


# YouTube videos  <img src="https://upload.wikimedia.org/wikipedia/commons/b/b8/YouTube_Logo_2017.svg" alt="YouTube Logo" width="100">

>>> <a href="https://youtu.be/X_P8bQABQrw?si=kLWM016_IBek1HTK"> Analysis of the AR regression data </a>




# Code to reproduce Figures and Tables in this Chapter





| FileName | Description | Open in MATLAB on line | Jupiter notebook | 
 |---|---|---|---| 
 |ARtraditional.m|AR data.<br/> This function creates Figures 3.1-3.5, 3.8 and 3.9. Figures 3.1-3.5: traditional non robust analysis. Figures 3.8-3.9: traditional robust analysis based on S and MM estimators.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap3//ARtraditional.m)| [[ipynb](ARtraditional.ipynb)]
|c_bdp_eff.m|Consistency factor, break down point and efficiency.<br/> This file createa Figure 3.6, 3.7, Table 3.2 and 3.3.|[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=UniprJRC/MonitoringBook&file=cap3//c_bdp_eff.m)| [[ipynb](c_bdp_eff.ipynb)]
