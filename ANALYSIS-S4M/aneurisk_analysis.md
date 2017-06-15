We analyze the aneurisk data set containing decriptive variables of patients showing ruptured and
unruptured aneurisms.


# Intro

In the next section we make an exploratory descriptive statistical analysis, to probe the main
characteristics in the data. In the following section we try out some preliminary models to explore
correlations that may prove useful for future, more realistic models.


# Descriptive Analysis

    source("../SOURCE-S4M/aneurisk.R")


## Individual viariable statistical analysis

Contingency tables for categorical variables and main statistical descriptors for continuous variables.

-   $ ESTADO\_RUPTURA         : chr  "U" "U" "U" "U" &#x2026;
    
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

-   $ LOCALIZACION\_ANEURISMA : chr  "ICA" "ICA" "ICA" "ICA" &#x2026;
    
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

-   $ SEXO                   : chr  "F" "F" "F" "F" &#x2026;
    
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

-   $ TIPO\_ANEURISMA         : chr  "LAT" "LAT" "TER" "TER" &#x2026;
    
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

-   $ EDAD                   : int  53 35 43 60 26 45 44 68 39 63 &#x2026;
    
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

-   $ MORPHO\_SHAPE           : int  1 1 0 0 0 2 2 1 2 1 &#x2026;
    
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

-   $ MULTIPLE\_ANEURISMA     : logi  FALSE FALSE FALSE TRUE FALSE FALSE &#x2026;
    
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

-   $ neckVesselAngle        : num  42.6 84.1 44 39.8 60 &#x2026;
    
          Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
        0.9618  13.5239  27.6917  38.1383  56.8219 126.6495
    
    ![img](../FIGS-S4M/neckVesselAngle.png)

-   $ sacVesselAngle         : num  33.82 94.53 52.29 4.98 56.48 &#x2026;
    -sacVesselAngle presents a skewed distribution.
    
          Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
        0.5619  16.6913  32.8631  40.2026  57.0421 146.9719
    
    ![img](../FIGS-S4M/sacVesselAngle.png)

-   $ bifurcationAngleInPlane: num  76.7 116.8 123.7 129.8 117.1 &#x2026;
    
         Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        61.65  107.20  118.96  124.94  143.84  209.67
    
    ![img](../FIGS-S4M/bifurcationAngleInPlane.png)
    
    Very slightly skewed distribution

-   $ tortuosity             : num  0.683 1.153 0.805 0.838 0.549 &#x2026;
    
             Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
        0.0002064 0.0186107 0.0852833 0.4012799 0.7593916 1.6800227
    
    ![img](../FIGS-S4M/tortuosity.png)
    
    Many low tortuosity with a broad group of higher tortuosity

-   $ aspectRatio\_star       : num  1.499 1.839 0.948 0.706 1.827 &#x2026;
    
          Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        0.5778  0.9820  1.3940  1.5377  1.8465  4.9736
    
    ![img](../FIGS-S4M/aspectRatio_star.png)
    
    Skewed and long tailed

-   $ sizeRatio\_star         : num  2.01 2.83 1.1 1.05 2.42 &#x2026;
    
          Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        0.7552  1.8575  2.5787  2.9272  3.4754 11.1081
    
    ![img](../FIGS-S4M/sizeRatio_star.png)
    
    Asymmetric but narrow-ish distribution

-   $ sacVolume              : num  125.26 119 12.74 9.38 37.93 &#x2026;
    
        Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        2.34   38.10   92.02  207.73  274.31 1312.03
    
    ![img](../FIGS-S4M/sacVolume.png)
    
    Power-law-ish

-   $ sacSurfaceArea         : num  120.5 122.4 23.5 18.1 54.8 &#x2026;
    
         Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        7.333  51.113  92.777 145.023 203.174 625.718
    
    ![img](../FIGS-S4M/sacSurfaceArea.png)
    
    Asymmetric

-   $ vdcVolume              : num  111.24 113.72 11.87 9.03 35.9 &#x2026;
    
         Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
        2.122   35.285   86.406  187.990  245.624 1223.412
    
    ![img](../FIGS-S4M/vdcVolume.png)
    
    Highly asymmetric and long-tailed

-   $ vdcSurfaceArea         : num  106.8 115.8 21.9 17.3 52.3 &#x2026;
    
         Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        6.495  49.520  83.265 129.520 176.755 583.440
    
    ![img](../FIGS-S4M/vdcSurfaceArea.png)
    
    Almost like a two-mode distribution, with some long tail

-   $ sacSectionArea         : num  21.94 18.49 6.14 4.91 9.73 &#x2026;
    
         Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        1.542  10.678  20.560  31.698  44.587 131.281

![img](../FIGS-S4M/sacSectionArea.png)

Asymmetric, similar to others


# Dimensionality reduction



## Locally Linear Embedding - LLE

![img](../FIGS-S4M/lle.png)


## IsoMap

![img](../FIGS-S4M/isomap.png)


# Regression Models


## Logistic regression of rupture/unruptered variable

A few regression models based on logistic regression (generalized linear model based on the binomial
distribution).

    
    Call:  glm(formula = ESTADO_RUPTURA_B ~ LOCALIZACION_ANEURISMA, family = binomial, 
        data = a)
    
    Coefficients:
                  (Intercept)  LOCALIZACION_ANEURISMABAS  
                       1.0986                    -0.8109  
    LOCALIZACION_ANEURISMAICA  LOCALIZACION_ANEURISMAMCA  
                      -2.0302                    -1.7346  
    
    Degrees of Freedom: 102 Total (i.e. Null);  99 Residual
    Null Deviance:	    140.6 
    Residual Deviance: 124.9 	AIC: 132.9

    
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

