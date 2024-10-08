% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/squares.R
\name{squares}
\alias{squares}
\title{Generate artwork structured as a grid of randomly coloured squares.}
\usage{
squares(
  n_rows = 5,
  n_cols = 10,
  gap_size = 0.1,
  neutrals = NULL,
  accents = NULL
)
}
\arguments{
\item{n_rows}{number of rows of squares in plot.}

\item{n_cols}{number of columns of squares in plot.}

\item{gap_size}{relative spacing between squares.}

\item{neutrals}{(optional) vector of neutral colours.}

\item{accents}{(optional) vector of accent colours.}
}
\value{
ggplot object
}
\description{
Generate artwork structured as a grid of randomly coloured squares.
}
