\name{CA}
\alias{CA}
\title{Capitalize Every Word of String}
\usage{
  CA(text = "clipboard", copy2clip = TRUE)
}
\arguments{
  \item{text}{A character vector or text copied to the
  clipboard.  Default is to read from the clipboard.}

  \item{copy2clip}{logical.  If \code{TRUE} attempts to
  copy the output to the clipboard.}
}
\value{
  Returns a character vector every word capitalized.
}
\description{
  Capitalizes every word of a string.
}
\details{
  This capitalizes every word of a string.
}
\section{Warning}{
  Ligatures parsing is very good, however, these elements
  my be incorrect.  If a warning is thrown check the use of
  "ff", "fi", "fl", "ffi" and "ffl".
}
\examples{
CA("the flexible, efficient way to do reports.")
}

