# Data Science Specialization

This repository tracks my progress towards getting Data Science Specialization through Coursera.

## Install Packages

### Install from CRAN

```{r setup}
install.packages("ggplot2")

install.packages(c("ggplot2", "devtools", "lme4"))
```

### Install from Bioconductor

```{r setup}
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install()

BiocManager::install("GenomicFeatures")
BiocManager::install(c("GenomicFeatures", "AnnotationDbi"))
```

### Install from GitHub

```{r setup}
install.packages("devtools")
library(devtools)
install_github("AUTHOR/PACKAGE)
```

## Load Packages

There may be an order to loading packages. Some packages have dependencies.
A package's manual / help pages will identify any dependencies.

```{r setup}
library()
library(ggplot2)
```

## Check Installed Packages

```{r setup}
library()
installed.packages()
```

## Update Packages

Check which packages need an update:

```{r setup}
old.packages()
```

Update all packages:

```{r setup}
update.packages()
```

Update an individual package:

```{r setup}
install.packages("PACKAGENAME")
```

## Unload Packages

```{r setup}
detach("package:ggplot2", unload=TRUE)
```

## Uninstall Packages

```{r setup}
remove.packages()
remove.packages("ggplot2")
```

## Check R Version

```{r setup}
version
sessionInfo()
```

## Help / Man Pages

```{r setup}
help()
help(package = "ggplot2")

browseVignettes()
browseVignettes("ggplot2")
```
