# MetaboAnalyst docker file
# see https://www.metaboanalyst.ca/
# run container with:
#  docker run --rm -p 8888:8787 -e PASSWORD=pasword metaboanalyst

# start with Bioconductor 3.13 and Shiny
FROM bioconductor/bioconductor_docker:RELEASE_3_13

RUN apt-get update && apt-get install -y \
  iputils-ping


# install Bioconductor dependencies
RUN R -e 'BiocManager::install(\
  c("Biobase",\
    "pcaMethods",\
    "RBGL",\
    "BiocParallel",\
    "edgeR",\
    "fgsea",\
    "impute",\
    "MSnbase",\
    "globaltest",\
    "GlobalAncova",\
    "Rgraphviz",\
    "genefilter",\
    "sva",\
    "KEGGgraph",\
    "ctc",\
    "OptiLCMS",\
    "siggenes"),\
  update = FALSE)'


# install CRAN dependencies
RUN R -e 'install.packages(\
  c("RColorBrewer",\
    "RSQLite",\
    "Cairo",\
    "Rcpp",\
    "ggplot2",\
    "progress",\
    "Rserve",\
    "plyr",\
    "data.table",\
    "qs",\
    "pROC",\
    "caret",\
    "crmn",\
    "glasso",\
    "igraph",\
    "plotly",\
    "pls",\
    "ellipse",\
    "scatterplot3d",\
    "randomForest",\
    "som",\
    "RJSONIO",\
    "rjson",\
    "ROCR",\
    "pheatmap",\
    "fitdistrplus",\
    "lars",\
    "Hmisc",\
    "metap",\
    "entropy",\
    "rsm",\
    "visNetwork",\
    "ggraph",\
    "RSclient",\
    "car",\
    "gdata",\
    "huge",\
    "ppcor"),\
  repos="https://packagemanager.rstudio.com/cran/2021-08-10+j7CXpjQ9")'


# copy and install MetabolanalystR
# COPY MetabolanalystR.tar.gz /MetabolanalystR.tar.gz
# RUN tar -zxf MetabolanalystR.tar.gz
# RUN R -e 'devtools::install("MetabolanalystR")'
RUN R -e 'devtools::install_github("xia-lab/MetaboAnalystR", upgrade = "never")'

# start up RShiny
CMD ["/init"]
