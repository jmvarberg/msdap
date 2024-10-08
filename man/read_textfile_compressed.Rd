% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/util_files.R
\name{read_textfile_compressed}
\alias{read_textfile_compressed}
\title{Read text files as vector of lines or a table, supports compressed files}
\usage{
read_textfile_compressed(
  file,
  as_table = FALSE,
  skip_empty_rows = FALSE,
  nrow = -1,
  datatable_skip = NULL,
  ...
)
}
\arguments{
\item{file}{path to input file}

\item{as_table}{boolean, TRUE = results from data.table::fread(), FALSE = results from readr::read_lines() (default)}

\item{skip_empty_rows}{ignore empty rows (default: FALSE)}

\item{nrow}{optionally, integer specifying to only read first N rows}

\item{datatable_skip}{hardcoded parameter for datatable_skip (set NULL to ignore; default)}

\item{...}{sent to data.table::fread()}
}
\value{
NULL if path doesn't exist or file could not be read / decompressed (warnings/errors are silent)
}
\description{
Supported compression formats; .zip|.gz|.bz2|.xz|.7z|.zst|.lz4
Using this function with other compression formats, or any of these formats but with unlisted file extensions, will not work
}
\details{
note; the archive R package has some bugs still so we try to use the readr package for common compression formats
e.g. bug while reading ZIP files; "Error: The size of the connection buffer (131072) was not large enough". Related bugreport @ https://github.com/tidyverse/vroom/issues/361

note; another bug is with reading Zstd archives compressed with --long
decompressing with current implementation results in;
Error: archive_read.cpp:102 archive_read_open1(): Zstd decompression failed: Frame requires too much memory for decoding
Related bugreport @ https://github.com/libarchive/libarchive/issues/1795
}
