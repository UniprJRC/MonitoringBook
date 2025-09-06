## Value added data: MM-regression
# This file creates Figure  8.35, Table 8.3 and Table 8.4
##

library(complmrob)          # for complmrob()
library(robustbase)         # for lmrob()

library(ggplot2)
library(latex2exp)          # for TeX()

prin <- FALSE               # whether to print to PDF

## Set the working directory to the location where the input file will be found
wd <- getwd()
setwd("c:/Users/valen/OneDrive/Documents/GitHub/MonitoringBook/cap8/")

theme_transparent <- function(base_size = rel(3.5), base_family = "") {
    ggplot2::theme_bw(base_size) +
        ggplot2::theme(
            plot.margin = grid::unit(c(0.2, 0.2, 0.5, 0.2), "lines"),
            panel.background = element_rect(fill = NA, color = NA),
            plot.background = element_rect(fill = NA, color = NA),
            legend.text = element_text(size = rel(2.5)),
            legend.title = element_blank(),
            axis.text = element_text(size = rel(0.9)),
            axis.title.x = element_text(vjust = 0),
            panel.grid.major = element_line(color = "gray30", linewidth = rel(0.5), linetype="dotted"),
            panel.grid.minor = element_blank(),
            strip.background = element_rect(fill = "#ffffff99", color = "gray50", linewidth = 0.3),
            strip.text = element_text(size = rel(0.9)),
            panel.border = element_rect(color = "gray50", linewidth = 0.3),
            legend.background = element_rect(fill = "#ffffff99", color = NA),
            legend.key = element_blank()
        )
}

## Load data: 
##  - dependent variable is life expectancy (life_exp) from HDI
##  - independent variables are low, medium and high - low, medium and high 
##      technology level share of Manufacturing Value Added
##  - hdi_score, exp_school and mean_school are other components of HDI which 
##      are not used in this example
##  - mvapc: manufacturing value added per capita (not used in this example)
##  - countrygroup and group code give the country groupings according to their 
##      industrial development
##  - country (UN country code), countrycode (ISO country code) and countryname
##
valueadded <- read.table("valueadded.txt", header=TRUE, stringsAsFactors=FALSE) 

## Remove any missing values and prepare the data set for regression
lifedata <- na.omit(valueadded[ , c("life_exp", "low", "medium", "high", "countrygroup")])

## Perform MM regression on compositional data (ilr transforming)
lifemod <- complmrob(life_exp ~ low + medium + high, data = lifedata)

## Perform MM regression on the original variables
lifemm <- lmrob(life_exp ~ low + medium + high, data = lifedata)

##  Table 8.3
summary(lifemod)

##  Table 8.4
summary(lifemm)

##  plot(lifemod, se = TRUE, scale = "percent")


##  Fig. 8.34
if(prin)
    pdf("mva-regression.pdf", width = 7.5, height = 4)

labels <- c(low = "low technology", medium = "medium low technology", high = "medium-high and high technology")

plot(lifemod, se = TRUE,
    pointStyle = list(size = 1.25),
    lineStyle = list(color = "#0090d0", width = 1),
    theme = theme_transparent(), seBandStyle = list(alpha = 0.5, color = "gray80")) +
    # coord_cartesian(ylim = c(0.45, 1)) +

    facet_grid(. ~ part, scale = "fixed", labeller = labeller(part=labels)) +
    xlab(TeX(r"( Contribution of the technology group to the total MVA (\textit{ilr}-transformed) )") ) +
    ylab("Life expectancy (years)") +
    theme(
        legend.position = "bottom",
        strip.text = element_text(size = 8)
    )

if(prin)
    dev.off()

setwd(wd)               # restore the working directory

#InsideREADME