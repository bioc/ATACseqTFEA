% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getWeightedBindingScore.R
\name{getWeightedBindingScore}
\alias{getWeightedBindingScore}
\title{Calculate the weighted binding score}
\usage{
getWeightedBindingScore(se, weight = NA, ...)
}
\arguments{
\item{se}{An \link[SummarizedExperiment:RangedSummarizedExperiment-class]{RangedSummarizedExperiment}
object. Outputs of \link{countsNormalization}.}

\item{weight}{If NA, the weight will be calculated by the open score.
See \link{calWeights}.
User can define the weight by a matrix or numeric vector.}

\item{...}{The parameters will be passed to \link{calWeights}.}
}
\value{
A RangedSummarizedExperiment object with assays of
count matrix with bindingSites, proximalRegion and distalRegion as
column names and bindingSites GRanges object as rowRanges.
}
\description{
Use user predefined weight to get the weighted binding score
or use open score to weight the binding score.
The open score is calculated by the counts of proximal region divided by
the counts of distal region.
The binding score is calculated by the counts of proximal region divided by
the counts of binding region. This value is the measure of avoidance of
reads in the binding sites.
}
\examples{
bam <- system.file("extdata",
                   "KD.shift.rep1.bam",
                   package="ATACseqTFEA")
bsl <- system.file("extdata", "bindingSites.rds",
                   package="ATACseqTFEA")
bindingSites <- readRDS(bsl)
## get the count regions
bsEx <- expandBindingSites(bindingSites)
## count reads by 5'ends
res <- count5ends(bam, positive=0L, negative=0L,
                  bindingSites=bindingSites,
                  bindingSitesWithGap=bsEx$bindingSitesWithGap,
                  bindingSitesWithProximal=bsEx$bindingSitesWithProximal,
                  bindingSitesWithProximalAndGap=
                      bsEx$bindingSitesWithProximalAndGap,
                  bindingSitesWithDistal=bsEx$bindingSitesWithDistal)
## filter 0 counts in proximal
se <- eventsFilter(res, proximalRegion>0)
## normalize counts by width of count region
se <- countsNormalization(se, proximal=40, distal=40)
## get the weighted binding scores
getWeightedBindingScore(se)
}
\author{
Jianhong Ou
}
