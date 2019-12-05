
# shinyLumi

## Description

This package provide a function for drawing density function of beta values from MethylumiSet object for methylation analysis along with a shiny app for that function.

## Installation

```{r}
require("devtools")
install_github("YH-HU/shinyLumi")
library(shinyLumi)
```

## overview

```{r}
browseVignettes("shinyLumi")
```

## Example

```{r}
idatPath <- system.file('inst/extdata/idat',package='shinyLumi')
mset450k <- methylumIDAT(getBarcodes(path=idatPath), idatPath=idatPath)
methylumiDensity(mset450k)
```
This example data does not contain information about sample groups, if you want to test capability of this function to work with sample groups, you may try the following.

```{r}
sample_sheet <- c(rep('Group A','Group B'),each = 5)
methylumiDensity(mset450k,sample_sheet)
```
For the shiny App, try 
```{r}
system.file('inst/extdata/idat', package = 'shinyLumi')
```
Then copy the returned string, which is the file path to sample idat file, into file path block of the app. Then click draw to see the output.

## Contribution

All of the codes are written by Yuhan Hu using Rstudio. The following function is for user.

```{r}
methylumiDensity
runshinyLumi
```

The package assume preprocess raw idat data by methylumi package. The first function draw density plot for beta values of methylation data preprocessed by methylumi package, which is a novel plot not in original methylation package. This plot can help methylation array analysis since function draw same kind of plot is implemented in minfi package. A shiny app for that plotting function is also included, currently there is no published shiny app utilizing methylation data preprocessed by methylumi package.

## Reference

Sean Davis, Pan Du, Sven Bilke, Tim Triche, Jr. and Moiz Bootwalla (2019). methylumi: Handle Illumina methylation data. R package version 2.30.0.

Davis S (2019). TCGAMethylation450k: The Cancer Genome Atlas Illumina 450k methylation example data. R package version 1.22.0.

Aryee MJ, Jaffe AE, Corrada-Bravo H, Ladd-Acosta C, Feinberg AP, Hansen KD, Irizarry RA (2014). “Minfi: A flexible and comprehensive Bioconductor package for the analysis of Infinium DNA Methylation microarrays.” Bioinformatics, 30(10), 1363–1369. doi: 10.1093/bioinformatics/btu049.

Maksimovic J, Gordon L, Oshlack A (2012). “SWAN: Subset quantile Within-Array Normalization for Illumina Infinium HumanMethylation450 BeadChips.” Genome Biology, 13(6), R44. doi: 10.1186/gb-2012-13-6-r44.

Fortin J, Labbe A, Lemire M, Zanke BW, Hudson TJ, Fertig EJ, Greenwood CM, Hansen KD (2014). “Functional normalization of 450k methylation array data improves replication in large cancer studies.” Genome Biology, 15(12), 503. doi: 10.1186/s13059-014-0503-2.

Triche TJ, Weisenberger DJ, Van Den Berg D, Laird PW, Siegmund KD (2013). “Low-level processing of Illumina Infinium DNA Methylation BeadArrays.” Nucleic Acids Research, 41(7), e90. doi: 10.1093/nar/gkt090.

Fortin J, Hansen KD (2015). “Reconstructing A/B compartments as revealed by Hi-C using long-range correlations in epigenetic data.” Genome Biology, 16, 180. doi: 10.1186/s13059-015-0741-y.

Andrews SV, Ladd-Acosta C, Feinberg AP, Hansen KD, Fallin MD (2016). “'Gap hunting' to characterize clustered probe signals in Illumina methylation array data.” Epigenetics & Chromatin, 9, 56. doi: 10.1186/s13072-016-0107-z.

Fortin J, Triche TJ, Hansen KD (2017). “Preprocessing, normalization and integration of the Illumina HumanMethylationEPIC array with minfi.” Bioinformatics, 33(4). doi: 10.1093/bioinformatics/btw691.
