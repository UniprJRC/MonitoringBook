## Value added data: tolerance ellipses and ternary diagrams
# This file creates Figure  8.33

##
##  Manufacturing Value Added data ilr-transformed: 
##  - Left-hand panel: 0.975 tolerance ellipses based on the robust (MCD) and classical Mahalanobis distances. 
##      The outliers identified by the robust Mahalanobis distances (outside the red
##      ellipse) are covered by the classical (blue) ellipse. 
##  - Right-hand panel: ternary diagram with classical and robust back-transformed 
##      Mahalanobis distance tolerance ellipses
##
library(rrcov)                  # for CovMcd()
library(robCompositions)        # for pivotCoord() and pivotCoordInv()


prin <- TRUE               # whether to print to PDF

## Set the working directory to the location where the input file will be found
wd <- getwd()
setwd("c:/Users/valen/OneDrive/Documents/GitHub/MonitoringBook/cap8/")

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
y1 <- valueadded[, c("low", "medium", "high")]
colnames(y1) <- c("LT", "MT", "MHT")
rownames(y1) <- valueadded$countrycode
grp <- as.factor(valueadded[, "countrygroup"])


pch0 <- 15:18               # symbols for country groups
col0 <- c(2, 3, 4, 5)       # colors for country groups
grp0 <- as.integer(grp)

## to choose better colors
library(DescTools)

Canvas(c(0,1))
ColorLegend(x=0, y=1, width=0.1, col=Pal(1, n=50))
ColorLegend(x=0.15, y=1, width=0.1, col=Pal(2, n=50))
ColorLegend(x=0.3, y=1, width=0.1, col=Pal(3, n=50))
ColorLegend(x=0.45, y=1, width=0.1, col=Pal(4, n=50))
ColorLegend(x=0.6, y=1, width=0.1, col=Pal(5, n=50))
ColorLegend(x=0.75, y=1, width=0.1, col=Pal(6, n=50))
ColorLegend(x=0.9, y=1, width=0.1, col=Pal(7))
ColorLegend(x=1.05, y=1, width=0.1, col=Pal(8))

col0 <- Pal(1, n=6)[2:5]

if(FALSE)
{
    ## Test it with the ternary function from package robCompositions.
    ##  Later we will adapt this function to produce the right-hand panel in Fig. 8.33
    ## 
    robCompositions::ternaryDiag(y1, grid=FALSE, text=rownames(y1), line="ellipse", lty=2, robust=TRUE, col=col0[grp0], pch=pch0[grp0], cex=1.5, bg=col0)
    legend("topleft", legend=levels(grp), col=col0, pch=pch0, cex=0.75)
}


##
## Function adapted from an older version of package robCompositions
##
ternary <- function(x, name = colnames(x), text = NULL, grid = TRUE, gridCol = grey(0.6),
        mcex = 1.2, line = "none", robust = TRUE, group = NULL, tol = 0.975, ...) {
    if (!(line %in% c("none", "pca", "regression", "regressionconf", "regressionpred", "ellipse", "lda")))
        stop("Choose a method for function argument *line*, which is implemented.")

    if (is.null(name)) {
        name <- c("P1", "P2", "P3")
    }

    if (length(name) != 3) {
        warning("incorrect length of name. Variable names P1, P2 and P3 are used instead.")
    }

    if (dim(x)[2] > 3) {
        warning("only the first three parts are used for plotting")
        x <- x[, 1:3]
    }

    if (dim(x)[2] < 3) {
        stop("x must include 3 variables/parts")
    }
    s <- rowSums(x)
    if (any(s <= 0))
        stop("each row of the input 'object' must have a positive sum")

    dat <- x/s
    xp <- dat[, 2] + dat[, 3]/2
    yp <- dat[, 3] * sqrt(3)/2
    par(pty = "s")
    plot(xp, yp, xlim = c(0, 1), ylim = c(0, 0.9), frame.plot = FALSE,
        xaxt = "n", yaxt = "n", xlab = "", ylab = "", ...)
    if (!is.null(text)) {
        if (length(text) != nrow(dat))
            stop(paste("text not of length", nrow(dat)))
        text(xp, yp, text)
    }
    segments(0, 0, 1, 0)
    segments(0, 0, 1/2, sqrt(3)/2)
    segments(1/2, sqrt(3)/2, 1, 0)
    mtext(name[1], side = 1, line = -1, at = -0.05, cex = mcex)
    mtext(name[2], side = 1, line = -1, at = 1.05, cex = mcex)
    text(0.5, 0.9, name[3], cex = mcex)
    if (grid) {
        b <- sqrt(c(0.03, 0.12, 0.27, 0.48))
        segments(0.2, 0, 0.1, sqrt(0.03), col = gridCol, lty = "dashed")
        segments(0.4, 0, 0.2, sqrt(0.12), col = gridCol, lty = "dashed")
        segments(0.6, 0, 0.3, sqrt(0.27), col = gridCol, lty = "dashed")
        segments(0.8, 0, 0.4, sqrt(0.48), col = gridCol, lty = "dashed")
        segments(0.2, 0, 0.6, sqrt(0.48), col = gridCol, lty = "dashed")
        segments(0.4, 0, 0.7, sqrt(0.27), col = gridCol, lty = "dashed")
        segments(0.6, 0, 0.8, sqrt(0.12), col = gridCol, lty = "dashed")
        segments(0.8, 0, 0.9, sqrt(0.03), col = gridCol, lty = "dashed")
        segments(0.1, sqrt(0.03), 0.9, sqrt(0.03), col = gridCol,
            lty = "dashed")
        segments(0.2, sqrt(0.12), 0.8, sqrt(0.12), col = gridCol,
            lty = "dashed")
        segments(0.3, sqrt(0.27), 0.7, sqrt(0.27), col = gridCol,
            lty = "dashed")
        segments(0.4, sqrt(0.48), 0.6, sqrt(0.48), col = gridCol,
            lty = "dashed")
        text(0.5, 0.66, "0.8", col = gridCol, cex = 0.6)
        text(0.5, 0.49, "0.6", col = gridCol, cex = 0.6)
        text(0.5, 0.32, "0.4", col = gridCol, cex = 0.6)
        text(0.5, 0.14, "0.2", col = gridCol, cex = 0.6)
        text(0.95, 0.21, "0.8", col = gridCol, cex = 0.6, srt = 60)
        text(0.86, 0.35, "0.6", col = gridCol, cex = 0.6, srt = 60)
        text(0.75, 0.54, "0.4", col = gridCol, cex = 0.6, srt = 60)
        text(0.64, 0.72, "0.2", col = gridCol, cex = 0.6, srt = 60)
        text(0.05, 0.21, "0.8", col = gridCol, cex = 0.6, srt = 300)
        text(0.14, 0.35, "0.6", col = gridCol, cex = 0.6, srt = 300)
        text(0.25, 0.54, "0.4", col = gridCol, cex = 0.6, srt = 300)
        text(0.36, 0.72, "0.2", col = gridCol, cex = 0.6, srt = 300)
    }

    plotTern <- function(x, conf = line, rob = robust)
    {

        z <- data.frame(robCompositions::pivotCoord(x))
        colnames(z) <- c("x", "y")
        lm1 <- if(rob) MASS::rlm(y ~ x, data = z, method = "MM")
               else    lm1 <- lm(y ~ x, data = z)

        new <- data.frame(x = seq(-30, 30, length = 10000))
        if (conf == "regressionpred") {
            pred.w.plim <- predict(lm1, new, interval = "prediction")
            s1 <- robCompositions::pivotCoordInv(data.frame(z1 = new$x, z2 = pred.w.plim[, 1]))
            s2 <- robCompositions::pivotCoordInv(data.frame(z1 = new$x, z2 = pred.w.plim[, 2]))
            s3 <- robCompositions::pivotCoordInv(data.frame(z1 = new$x, z2 = pred.w.plim[, 3]))
        } else if (conf == "regressionconf") {
            pred.w.plim <- predict(lm1, new, interval = "confidence")
            s1 <- robCompositions::pivotCoordInv(data.frame(z1 = new$x, z2 = pred.w.plim[,
                1]))
            s2 <- robCompositions::pivotCoordInv(data.frame(z1 = new$x, z2 = pred.w.plim[,
                2]))
            s3 <- robCompositions::pivotCoordInv(data.frame(z1 = new$x, z2 = pred.w.plim[,
                3]))
        } else {
            pred.w.plim <- predict(lm1, new)
            s1 <- robCompositions::pivotCoordInv(data.frame(z1 = new$x, z2 = pred.w.plim))
            s2 <- robCompositions::pivotCoordInv(data.frame(z1 = new$x, z2 = pred.w.plim))
            s3 <- robCompositions::pivotCoordInv(data.frame(z1 = new$x, z2 = pred.w.plim))
        }

        dat1 <- s1
        dat2 <- s2
        dat3 <- s3
        xp1 <- dat1[, 2] + dat1[, 3]/2
        yp1 <- dat1[, 3] * sqrt(3)/2
        xp2 <- dat2[, 2] + dat2[, 3]/2
        yp2 <- dat2[, 3] * sqrt(3)/2
        xp3 <- dat3[, 2] + dat3[, 3]/2
        yp3 <- dat3[, 3] * sqrt(3)/2
        lines(xp1, yp1, xlim = c(0, 1), ylim = c(0, 0.9), xaxt = "n",
            yaxt = "n", xlab = "", ylab = "", col = 1, lwd = 2)
        if (conf %in% c("regressionpred", "regressionconf")) {
            lines(xp2, yp2, xlim = c(0, 1), ylim = c(0, 0.9),
                xaxt = "n", yaxt = "n", xlab = "", ylab = "",
                lty = 2, col = gray(0.5))
            lines(xp3, yp3, xlim = c(0, 1), ylim = c(0, 0.9),
                xaxt = "n", yaxt = "n", xlab = "", ylab = "",
                lty = 2, col = gray(0.5))
        }
        legend("topleft", legend = paste(colnames(x)[1], "~",
            colnames(x)[2], "+", colnames(x)[3]), lwd = 2, col = "black")
    }
    f <- function(x, co = "black", lt = 1, rob = robust) {
        a <- constSum(x, 1)
        a <- robCompositions::pivotCoord(x)
        if (rob) {
            rc <- robustbase::covMcd(a)
            me <- rc$center
            acov <- rc$cov
        }
        else {
            me <- apply(a, 2, mean)
            acov <- var(a)
        }
        apca <- princomp(cov = acov)
        x0 <- -11 * apca$loa[1, 1] + me[1]
        y0 <- -11 * apca$loa[2, 1] + me[2]
        x1 <- 11 * apca$loa[1, 1] + me[1]
        y1 <- 11 * apca$loa[2, 1] + me[2]
        s1 <- seq(x0, x1, length = 100)
        s2 <- seq(y0, y1, length = 100)
        s <- data.frame(s1 = s1, s2 = s2)
        ss <- robCompositions::pivotCoordInv(s)
        s1 <- rowSums(ss)
        dat <- ss/s1
        xp <- dat[, 2] + dat[, 3]/2
        yp <- dat[, 3] * sqrt(3)/2
        lines(xp, yp, xlim = c(0, 1), ylim = c(0, 0.9), xaxt = "n",
            yaxt = "n", xlab = "", ylab = "", ...)
        legend("right", legend = "PC 1", lty = 1, lwd = 2, col = "black")
    }

    dcov <- function(x, tolerance = tol, rob=robust) {
        z <- robCompositions::pivotCoord(x)

        if(rob)
        {
            rc <- robustbase::covMcd(z)
            me <- rc$center
            acov <- rc$cov
            col <- "red"
        }else {
            me <- colMeans(z)
            acov <- cov(z)
            col <- "blue"
        }

        dat1 <- robCompositions:::drawMahal(z, me, acov, plot = FALSE,
            whichlines = tolerance)
        dat2 <- robCompositions:::drawMahal(z, colMeans(z), cov(z), plot = FALSE,
            whichlines = tolerance)

        for (i in 1:length(tolerance)) {
            e <- robCompositions::pivotCoordInv(cbind(dat1$mdX[, i], dat1$mdY[,
                i]))
            xp1 <- e[, 2] + e[, 3]/2
            yp1 <- e[, 3] * sqrt(3)/2
            lines(xp1, yp1, xlim = c(0, 1), ylim = c(0, 0.9),
                xaxt = "n", yaxt = "n", xlab = "", ylab = "", col=col)
        }
        for (i in 1:length(tolerance)) {
            e <- robCompositions::pivotCoordInv(cbind(dat2$mdX[, i], dat2$mdY[,
                i]))
            xp1 <- e[, 2] + e[, 3]/2
            yp1 <- e[, 3] * sqrt(3)/2
            lines(xp1, yp1, xlim = c(0, 1), ylim = c(0, 0.9),
                xaxt = "n", yaxt = "n", xlab = "", ylab = "", col="blue")
        }
    }

    da <- function(x, grp = group) {
        z <- robCompositions::pivotCoord(x)
        lev <- levels(factor(grp))
        if (length(lev) != 2)
            stop("group must be a factor with exactly two levels")
        z1 <- z[grp == lev[1], ]
        z2 <- z[grp == lev[2], ]
        n1 = nrow(z1)
        n2 = nrow(z2)
        n = n1 + n2
        p1 = n1/n
        p2 = n2/n
        m1 = apply(z1, 2, mean)
        m2 = apply(z2, 2, mean)
        S1 = cov(z1)
        S2 = cov(z2)
        Sp = ((n1 - 1)/(n1 - 1 + n2 - 1)) * S1 + ((n2 - 1)/(n1 -
            1 + n2 - 1)) * S2
        Sp1 = solve(Sp)
        yLDA = as.numeric(t(m1 - m2) %*% Sp1 %*% t(z) - as.numeric(1/2 *
            t(m1 - m2) %*% Sp1 %*% (m1 + m2))) - log(p2/p1)
        y1 = seq(from = min(z[, 1]) - 1.5, to = max(z[, 1]) +
            1.9, by = 0.05)
        y2 = seq(from = min(z[, 2]), to = max(z[, 2]) + 0.2,
            by = 0.05)
        y1a = rep(y1, length(y2))
        y2a = sort(rep(y2, length(y1)))
        ya = cbind(y1a, y2a)
        yaLDA <- as.numeric(t(m1 - m2) %*% Sp1 %*% t(ya) - as.numeric(1/2 *
            t(m1 - m2) %*% Sp1 %*% (m1 + m2))) - log(p2/p1)
        boundLDA <- abs(yaLDA) < 1.5
        bline <- lowess(y1a[boundLDA], y2a[boundLDA])
        blines <- data.frame(z1 = bline$x, z2 = bline$y)
        k <- (bline$x[2] - bline$x[1])/(bline$y[2] - bline$y[1])
        LINE <- function(p, k) {
            seq(p, 0.95, )
        }
        xblines <- robCompositions::pivotCoordInv(blines)
        xp1 <- xblines[, 2] + xblines[, 3]/2
        yp1 <- xblines[, 3] * sqrt(3)/2
        lines(xp1, yp1, xlim = c(0, 1), ylim = c(0, 0.9), xaxt = "n",
            yaxt = "n", xlab = "", ylab = "", ...)
    }

    if (line == "pca")
        f(dat, co = "black", lt = 1)

    if (line == "regression")
        plotTern(dat[, c(1, 2, 3)], conf = FALSE)
    if (line == "regressionconf")
        plotTern(dat[, c(1, 2, 3)], conf = "regressionconf")
    if (line == "regressionpred")
        plotTern(dat[, c(1, 2, 3)], conf = "regressionpred")

    if (line == "ellipse")
        dcov(x)

    if (line == "lda") {
        da(x, grp = group)
        grp <- group
        points(xp[grp == levels(factor(grp))[1]], yp[grp == levels(factor(grp))[1]],
            pch = 1)
        points(xp[grp == levels(factor(grp))[2]], yp[grp == levels(factor(grp))[2]],
            pch = 4)
    }
}

##=============================================================================

##  y1ilr <- rrcov3way:::.ilrV(y1)
y1ilr <- robCompositions::pivotCoord(y1)
plot(mcd <- CovMcd(y1ilr, nsamp="deterministic"), which="tolEllipse", class=TRUE, labs=paste0("     ", rownames(y1)))
if(prin)
    savePlot(type="pdf", file="mva-mcd.pdf")

ternary(y1, grid=FALSE, line="ellipse", lty=2, robust=TRUE, col=col0[grp0], pch=pch0[grp0], cex=1.5, bg=col0)
legend("topleft", legend=levels(grp), col=col0, pch=pch0, cex=0.75)

if(prin)
    savePlot(type="pdf", file="mva-ternary.pdf")

## Restore the original working directory
setwd(wd) 

#InsideREADME