<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#org56d5c74">1. Intro</a></li>
<li><a href="#org220170f">2. Descriptive Analysis</a>
<ul>
<li><a href="#org7d1854d">2.1. Individual viariable statistical analysis</a>
<ul>
<li><a href="#org7ed24f7">2.1.1. $ ESTADO_RUPTURA</a></li>
<li><a href="#org5754bff">2.1.2. $ LOCALIZACION_ANEURISMA</a></li>
<li><a href="#org84b2a40">2.1.3. $ SEXO</a></li>
<li><a href="#org4f2fa19">2.1.4. $ TIPO_ANEURISMA</a></li>
<li><a href="#org5d8cc49">2.1.5. $ EDAD</a></li>
<li><a href="#orgca7d00d">2.1.6. $ MORPHO_SHAPE</a></li>
<li><a href="#org7f88202">2.1.7. $ MULTIPLE_ANEURISMA</a></li>
<li><a href="#org8a7edf0">2.1.8. $ neckVesselAngle</a></li>
<li><a href="#orgfd84291">2.1.9. $ sacVesselAngle</a></li>
<li><a href="#orgb239df5">2.1.10. $ bifurcationAngleInPlane</a></li>
<li><a href="#orgf22d5c5">2.1.11. $ tortuosity</a></li>
<li><a href="#orgcd71af8">2.1.12. $ aspectRatio_star</a></li>
<li><a href="#org3e119d2">2.1.13. $ sizeRatio_star</a></li>
<li><a href="#orgad72b51">2.1.14. $ sacVolume</a></li>
<li><a href="#org80182f3">2.1.15. $ sacSurfaceArea</a></li>
<li><a href="#org4e94323">2.1.16. $ vdcVolume</a></li>
<li><a href="#org6a3a813">2.1.17. $ vdcSurfaceArea</a></li>
<li><a href="#org5c20a14">2.1.18. $ sacSectionArea</a></li>
</ul>
</li>
<li><a href="#org15aedaf">2.2. Histograms of sacVolume and sacSurfaceArea</a></li>
</ul>
</li>
<li><a href="#orga9b0e01">3. Variable selection</a></li>
<li><a href="#orgcc91bfa">4. Data preprocessing</a></li>
<li><a href="#org174869a">5. Non-linear manifold learning</a>
<ul>
<li><a href="#org1af5686">5.1. Locally Linear Embedding - LLE</a></li>
<li><a href="#org511880e">5.2. IsoMap</a></li>
</ul>
</li>
<li><a href="#org41aee48">6. Regression Models</a>
<ul>
<li><a href="#org48014fa">6.1. Logistic regression of rupture/unruptered variable</a></li>
</ul>
</li>
</ul>
</div>
</div>
We analyze the aneurisk data set containing decriptive variables of patients showing ruptured and
unruptured aneurisms.


<a id="org56d5c74"></a>

# Intro

In the next section we make an exploratory descriptive statistical analysis, to probe the main
characteristics in the data. In the following section we try out some preliminary models to explore
correlations that may prove useful for future, more realistic models.


<a id="org220170f"></a>

# Descriptive Analysis


<a id="org7d1854d"></a>

## Individual viariable statistical analysis

Contingency tables for categorical variables and main statistical descriptors for continuous variables.


<a id="org7ed24f7"></a>

### $ ESTADO\_RUPTURA

    chr  "U" "U" "U" "U" ...

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-right" />
</colgroup>
<tbody>
<tr>
<td class="org-left">R</td>
<td class="org-right">44</td>
</tr>


<tr>
<td class="org-left">U</td>
<td class="org-right">59</td>
</tr>
</tbody>
</table>


<a id="org5754bff"></a>

### $ LOCALIZACION\_ANEURISMA

    chr  "ICA" "ICA" "ICA" "ICA" ...

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-right" />
</colgroup>
<tbody>
<tr>
<td class="org-left">ACA</td>
<td class="org-right">24</td>
</tr>


<tr>
<td class="org-left">BAS</td>
<td class="org-right">7</td>
</tr>


<tr>
<td class="org-left">ICA</td>
<td class="org-right">46</td>
</tr>


<tr>
<td class="org-left">MCA</td>
<td class="org-right">26</td>
</tr>
</tbody>
</table>


<a id="org84b2a40"></a>

### $ SEXO

    chr  "F" "F" "F" "F" ...

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-right" />
</colgroup>
<tbody>
<tr>
<td class="org-left">F</td>
<td class="org-right">65</td>
</tr>


<tr>
<td class="org-left">M</td>
<td class="org-right">38</td>
</tr>
</tbody>
</table>


<a id="org4f2fa19"></a>

### $ TIPO\_ANEURISMA

    chr  "LAT" "LAT" "TER" "TER" ...

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-right" />
</colgroup>
<tbody>
<tr>
<td class="org-left">LAT</td>
<td class="org-right">40</td>
</tr>


<tr>
<td class="org-left">TER</td>
<td class="org-right">63</td>
</tr>
</tbody>
</table>


<a id="org5d8cc49"></a>

### $ EDAD

    int  53 35 43 60 26 45 44 68 39 63 ...

We compute minimum, median and maximum age, along with quantiles 25 and 75. 

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-right" />
</colgroup>
<tbody>
<tr>
<td class="org-left">min</td>
<td class="org-right">24</td>
</tr>


<tr>
<td class="org-left">q25</td>
<td class="org-right">43</td>
</tr>


<tr>
<td class="org-left">med</td>
<td class="org-right">55</td>
</tr>


<tr>
<td class="org-left">q75</td>
<td class="org-right">64.5</td>
</tr>


<tr>
<td class="org-left">max</td>
<td class="org-right">85</td>
</tr>
</tbody>
</table>


<a id="orgca7d00d"></a>

### $ MORPHO\_SHAPE

    int  1 1 0 0 0 2 2 1 2 1 ...

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-right" />

<col  class="org-right" />
</colgroup>
<tbody>
<tr>
<td class="org-right">0</td>
<td class="org-right">31</td>
</tr>


<tr>
<td class="org-right">1</td>
<td class="org-right">29</td>
</tr>


<tr>
<td class="org-right">2</td>
<td class="org-right">43</td>
</tr>
</tbody>
</table>


<a id="org7f88202"></a>

### $ MULTIPLE\_ANEURISMA

    logi  FALSE FALSE FALSE TRUE FALSE FALSE ...

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-right" />
</colgroup>
<tbody>
<tr>
<td class="org-left">FALSE</td>
<td class="org-right">86</td>
</tr>


<tr>
<td class="org-left">TRUE</td>
<td class="org-right">17</td>
</tr>
</tbody>
</table>


<a id="org8a7edf0"></a>

### $ neckVesselAngle

    num  42.6 84.1 44 39.8 60 ...

      Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    0.9618  13.5239  27.6917  38.1383  56.8219 126.6495

![img](../FIGS-S4M/neckVesselAngle.png)

![img](../FIGS-S4M/neckVesselAngle_UR.png)


<a id="orgfd84291"></a>

### $ sacVesselAngle

    num  33.82 94.53 52.29 4.98 56.48 ...

sacVesselAngle presents a skewed distribution.

      Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    0.5619  16.6913  32.8631  40.2026  57.0421 146.9719

![img](../FIGS-S4M/sacVesselAngle.png)

![img](../FIGS-S4M/sacVesselAngle_UR.png)


<a id="orgb239df5"></a>

### $ bifurcationAngleInPlane

    num  76.7 116.8 123.7 129.8 117.1 ...

     Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    61.65  107.20  118.96  124.94  143.84  209.67

![img](../FIGS-S4M/bifurcationAngleInPlane.png)

Very slightly skewed distribution


<a id="orgf22d5c5"></a>

### $ tortuosity

    num  0.683 1.153 0.805 0.838 0.549 ...

         Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
    0.0002064 0.0186107 0.0852833 0.4012799 0.7593916 1.6800227

![img](../FIGS-S4M/tortuosity.png)

Many low tortuosity with a broad group of higher tortuosity

![img](../FIGS-S4M/tortuosity_UR.png)


<a id="orgcd71af8"></a>

### $ aspectRatio\_star

    num  1.499 1.839 0.948 0.706 1.827 ...

      Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    0.5778  0.9820  1.3940  1.5377  1.8465  4.9736

![img](../FIGS-S4M/aspectRatio_star.png)

Skewed and long tailed

![img](../FIGS-S4M/aspectRatio_star_UR.png)


<a id="org3e119d2"></a>

### $ sizeRatio\_star

    num  2.01 2.83 1.1 1.05 2.42 ...

      Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    0.7552  1.8575  2.5787  2.9272  3.4754 11.1081

![img](../FIGS-S4M/sizeRatio_star.png)

Asymmetric but narrow-ish distribution

![img](../FIGS-S4M/sizeRatio_star_UR.png)


<a id="orgad72b51"></a>

### $ sacVolume

    num  125.26 119 12.74 9.38 37.93 ...

    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    2.34   38.10   92.02  207.73  274.31 1312.03

![img](../FIGS-S4M/sacVolume.png)

Power-law-ish


<a id="org80182f3"></a>

### $ sacSurfaceArea

    num  120.5 122.4 23.5 18.1 54.8 ...

     Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    7.333  51.113  92.777 145.023 203.174 625.718

![img](../FIGS-S4M/sacSurfaceArea.png)

Asymmetric


<a id="org4e94323"></a>

### $ vdcVolume

    num  111.24 113.72 11.87 9.03 35.9 ...

     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    2.122   35.285   86.406  187.990  245.624 1223.412

![img](../FIGS-S4M/vdcVolume.png)

Highly asymmetric and long-tailed


<a id="org6a3a813"></a>

### $ vdcSurfaceArea

    num  106.8 115.8 21.9 17.3 52.3 ...

     Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    6.495  49.520  83.265 129.520 176.755 583.440

![img](../FIGS-S4M/vdcSurfaceArea.png)

Almost like a two-mode distribution, with some long tail


<a id="org5c20a14"></a>

### $ sacSectionArea

    num  21.94 18.49 6.14 4.91 9.73 ...

     Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    1.542  10.678  20.560  31.698  44.587 131.281

![img](../FIGS-S4M/sacSectionArea.png)

Asymmetric, similar to others


<a id="org15aedaf"></a>

## Histograms of sacVolume and sacSurfaceArea

Histograms are approximately the same for volume and surface both for ruptured and unruptured
aneurisms.

![img](../FIGS-S4M/sacVolume_histogram.png)

![img](../FIGS-S4M/sacSurfaceArea_histogram.png)


<a id="orga9b0e01"></a>

# Variable selection

Our response or dependent variable will be considered to be ESTADO\_RUPTURA. We concentrate in the
following subset of predictor or independent variables:

-   aspectRatio\_star
-   sizeRatio\_star
-   tortuosity
-   MORPHO\_SHAPE
-   SEXO
-   EDAD

On the other hand, we do not consider the following variables:

-   ID
-   fusiforme (pendiente)
-   sacVolume
-   sacSurfaceArea
-   MULTIPLE\_ANEURISMA
-   neckVesselAngle
-   sacVesselAngle
-   bifurcationAngleInPlane


<a id="orgcc91bfa"></a>

# Data preprocessing

We perform several transformations to the variables for comparison purposes as well as to work with
variables with less skewness. In particular we are able to combine any of the following: 

-   center (mean substraction)
-   scale  (standard deviation for normalization)
-   Box-Cox transformation (decrease skewness)
-   PCA (dimensionality reduction, both d=2 and d=3)


<a id="org174869a"></a>

# Non-linear manifold learning

We work with two non-linear algorithms to go beyond PCA: LLE and Isomap.


<a id="org1af5686"></a>

## Locally Linear Embedding - LLE

![img](../FIGS-S4M/lle.png)


<a id="org511880e"></a>

## IsoMap

The figure below is a straightforward application of Isomap with data preprocessing, including
only continuous data ("aspectRatio\_star", "sizeRatio\_star", "tortuosity", "EDAD").

In the following we explore residual variance accross the different dimensions.

![img](../FIGS-S4M/isomap_residuals_vs_dim.png)

We perform Isomap on these 4 variables, and reduce dimensionality to 3. We plot only the first two components.

![img](../FIGS-S4M/isomap.png)

In 3D:

<img style="WIDTH:600px; HEIGHT:420px; border:0" src="../FIGS-S4M/isomap3d.png">


<a id="org41aee48"></a>

# Regression Models


<a id="org48014fa"></a>

## Logistic regression of rupture/unruptered variable

A few regression models based on logistic regression (generalized linear model based on the binomial
distribution).

    logreg <- glm(ESTADO_RUPTURA ~ SEXO + EDAD + tortuosity + MORPHO_SHAPE, family = "binomial", data = a) 
    print(summary(logreg))

    
    Call:
    glm(formula = ESTADO_RUPTURA ~ SEXO + EDAD + tortuosity + MORPHO_SHAPE, 
        family = "binomial", data = a)
    
    Deviance Residuals: 
        Min       1Q   Median       3Q      Max  
    -1.8652  -1.1384   0.5768   1.0398   1.7332  
    
    Coefficients:
                  Estimate Std. Error z value Pr(>|z|)   
    (Intercept)   -0.12486    0.91121  -0.137  0.89101   
    SEXOM          0.14468    0.47067   0.307  0.75855   
    EDAD          -0.01762    0.01627  -1.083  0.27872   
    tortuosity     1.59231    0.58774   2.709  0.00674 **
    MORPHO_SHAPE1  1.04365    0.56675   1.841  0.06555 . 
    MORPHO_SHAPE2  1.10000    0.53028   2.074  0.03805 * 
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
    
    (Dispersion parameter for binomial family taken to be 1)
    
        Null deviance: 140.60  on 102  degrees of freedom
    Residual deviance: 126.45  on  97  degrees of freedom
    AIC: 138.45
    
    Number of Fisher Scoring iterations: 3

    Computing distance matrix ... done
    Building graph with shortest paths (using 10 nearest neighbours) ... done
    Computing low dimensional embedding ... done
    number of samples: 103
    reduction from 4 to 3 dimensions
    number of connected components in graph: 1
    quartz 
         2
    
    Call:
    glm(formula = ESTADO_RUPTURA_B ~ LOCALIZACION_ANEURISMA, family = binomial, 
        data = a)
    
    Deviance Residuals: 
        Min       1Q   Median       3Q      Max  
    -1.6651  -0.8684  -0.8150   0.9082   1.5898  
    
    Coefficients:
                              Estimate Std. Error z value Pr(>|z|)    
    (Intercept)                 1.0986     0.4714   2.331 0.019779 *  
    LOCALIZACION_ANEURISMABAS  -0.8109     0.8975  -0.904 0.366252    
    LOCALIZACION_ANEURISMAICA  -2.0302     0.5740  -3.537 0.000405 ***
    LOCALIZACION_ANEURISMAMCA  -1.7346     0.6262  -2.770 0.005607 ** 
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
    
    (Dispersion parameter for binomial family taken to be 1)
    
        Null deviance: 140.60  on 102  degrees of freedom
    Residual deviance: 124.87  on  99  degrees of freedom
    AIC: 132.87
    
    Number of Fisher Scoring iterations: 4

    
    Call:
    glm(formula = ESTADO_RUPTURA_B ~ neckVesselAngle * bifurcationAngleInPlane, 
        family = binomial(), data = aneurisk, na.action = na.omit)
    
    Deviance Residuals: 
        Min       1Q   Median       3Q      Max  
    -1.8590  -0.9983  -0.7918   1.2148   1.7398  
    
    Coefficients:
                                              Estimate Std. Error z value Pr(>|z|)
    (Intercept)                             -2.9160159  1.5303636  -1.905   0.0567
    neckVesselAngle                          0.0647486  0.0356804   1.815   0.0696
    bifurcationAngleInPlane                  0.0245702  0.0118877   2.067   0.0387
    neckVesselAngle:bifurcationAngleInPlane -0.0006494  0.0003101  -2.094   0.0363
                                             
    (Intercept)                             .
    neckVesselAngle                         .
    bifurcationAngleInPlane                 *
    neckVesselAngle:bifurcationAngleInPlane *
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
    
    (Dispersion parameter for binomial family taken to be 1)
    
        Null deviance: 140.6  on 102  degrees of freedom
    Residual deviance: 132.2  on  99  degrees of freedom
    AIC: 140.2
    
    Number of Fisher Scoring iterations: 4

    
    Call:
    glm(formula = ESTADO_RUPTURA_B ~ tortuosity * aspectRatio_star, 
        family = binomial(), data = aneurisk, na.action = na.omit)
    
    Deviance Residuals: 
        Min       1Q   Median       3Q      Max  
    -1.5891  -1.0205  -0.7309   1.1491   1.7747  
    
    Coefficients:
                                Estimate Std. Error z value Pr(>|z|)
    (Intercept)                  -0.6222     0.7292  -0.853    0.394
    tortuosity                   -0.4067     1.2380  -0.329    0.743
    aspectRatio_star              0.5787     0.4681   1.236    0.216
    tortuosity:aspectRatio_star  -0.6608     0.7276  -0.908    0.364
    
    (Dispersion parameter for binomial family taken to be 1)
    
        Null deviance: 140.60  on 102  degrees of freedom
    Residual deviance: 130.54  on  99  degrees of freedom
    AIC: 138.54
    
    Number of Fisher Scoring iterations: 4

    
    Call:
    glm(formula = ESTADO_RUPTURA_B ~ tortuosity + aspectRatio_star, 
        family = binomial(), data = aneurisk, na.action = na.omit)
    
    Deviance Residuals: 
        Min       1Q   Median       3Q      Max  
    -1.3893  -1.1716  -0.6983   1.1202   1.9337  
    
    Coefficients:
                     Estimate Std. Error z value Pr(>|z|)   
    (Intercept)       -0.1341     0.4876  -0.275  0.78329   
    tortuosity        -1.4507     0.5159  -2.812  0.00492 **
    aspectRatio_star   0.2476     0.2820   0.878  0.37996   
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
    
    (Dispersion parameter for binomial family taken to be 1)
    
        Null deviance: 140.60  on 102  degrees of freedom
    Residual deviance: 131.41  on 100  degrees of freedom
    AIC: 137.41
    
    Number of Fisher Scoring iterations: 4

