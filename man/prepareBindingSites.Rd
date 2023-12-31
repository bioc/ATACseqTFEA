% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prepareBindingSites.R
\name{prepareBindingSites}
\alias{prepareBindingSites}
\title{Prepare binding site for TFEA}
\usage{
prepareBindingSites(
  pwms,
  genome,
  seqlev = seqlevels(genome),
  p.cutoff = 1e-05,
  w = 7,
  grange,
  maximalBindingWidth = 40L,
  mergeBindingSitesByPercentage = 0.8,
  ignore.strand = TRUE
)
}
\arguments{
\item{pwms}{either \code{\link[TFBSTools]{PFMatrix}},
\code{\link[TFBSTools]{PFMatrixList}}, \code{\link[TFBSTools]{PWMatrix}},
\code{\link[TFBSTools]{PWMatrixList}}}

\item{genome}{\code{\link[BSgenome:BSgenome-class]{BSgenome}} object.}

\item{seqlev}{A character vector. Sequence levels to be searched.}

\item{p.cutoff}{p-value cutoff for returning motifs; default is 1e-05}

\item{w}{parameter controlling size of window for filtration; default is 7}

\item{grange}{GRanges for motif search. If it is set, function will only
search the binding site within the grange. Usually a peak list should be
supplied.}

\item{maximalBindingWidth}{A numeric vector(length=1).
Maximal binding site width. Default is 40.}

\item{mergeBindingSitesByPercentage}{A numeric vector (length=1).
The percentage of overlapping region of binding sites to merge as one
binding site.}

\item{ignore.strand}{When set to TRUE, the strand information is ignored in
the calculations.}
}
\value{
A \code{\link[GenomicRanges:GRanges-class]{GenomicRanges}} with
all the positions of matches.
}
\description{
Prepare binding sites by given position weight matrix and
 genome.
}
\examples{
library(TFBSTools)
motifs <- readRDS(system.file("extdata", "PWMatrixList.rds",
                              package="ATACseqTFEA"))
library(BSgenome.Drerio.UCSC.danRer10)
seqlev <- "chr1" #paste0("chr", 1:25)
mts <- prepareBindingSites(motifs, Drerio, seqlev,
                           grange=GRanges("chr1",
                                          IRanges(5000, 100000)))
}
\author{
Jianhong Ou
}
