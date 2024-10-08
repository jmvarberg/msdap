% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stats_summary.R
\name{summarise_stats}
\alias{summarise_stats}
\title{Summarize DEA and/or differential detection results in a dataset into a table with a single statistic per gene}
\usage{
summarise_stats(
  dataset,
  return_dea = TRUE,
  return_diffdetect = FALSE,
  dea_logfc_as_effectsize = FALSE,
  diffdetect_zscore_threshold = 6,
  diffdetect_type = "auto"
)
}
\arguments{
\item{dataset}{dataset where dea() and/or differential_detect() has been applied}

\item{return_dea}{boolean, set to TRUE to include DEA results in the stats table that returns 1 value per gene (setting TRUE for both DEA and DD will merge results)}

\item{return_diffdetect}{analogous to \code{return_dea}, but setting this to TRUE includes differential detection results}

\item{dea_logfc_as_effectsize}{optionally, the resulting effectsize column can be populated with standardized foldchange values (effectsize = log2fc / sd(log2fc)).
When including differential detection results this'll be a convenient approach to getting 1 standardized distribution of DEA+DD effectsizes that can be used in e.g. GO analyses.
While this is unusual, one could e.g. use this for DEA algorithms that apply shrinkage to estimated foldchanges such as MSqRob}

\item{diffdetect_zscore_threshold}{differential detect z-score cutoff. A typical value would be 5 or 6 (default)
To plot histograms of the respective z-score distributions and inspect potential cutoff values for this relatively arbitrary metric, see below example code}

\item{diffdetect_type}{type of differential detect scores. options:
'auto' = set to 'detect' if this score is available, 'quant' otherwise
'detect' = differential detection z-scores computed from only "detected" peptides (no MBR)
'quant' = differential detection z-scores computed from all quantified peptides (uses MBR)}
}
\description{
In most cases, you probably want to use the \code{export_stats_genesummary()} function instead.
That is a wrapper function that uses this function but also adds additional functionality.
For documentation on the output table, also refer to that function.
}
