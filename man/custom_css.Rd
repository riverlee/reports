\name{custom_css}
\alias{custom_css}
\title{Generate Custom css for RStudio + knitr}
\usage{
  custom_css(rprofile = FALSE,
    loc = file.path(getwd(), "REPORT"), style.css = NULL,
    source = TRUE)
}
\arguments{
  \item{rprofile}{logical.  If \code{TRUE} the style.R is
  added to the .Rprofile for sourcing upon startup.}

  \item{loc}{Path to the report location where the custom
  css should be placed. If \code{NULL} only the style.R is
  created in the base directory .Rprofile.}

  \item{style.css}{An optional path to a style.css file
  that will be used as the ~/css/style.css.}

  \item{source}{logical.  If \code{TRUE} the style.R is
  sourced intially.}
}
\description{
  Generate the components necessary for a custom css for
  use with RStudio and knitr.
}
\details{
  The user must add the custom contents to the custom css
  located in ~/css/style.css
}
\note{
  The user has to source before the custom styles will be
  applied. The user may specify \code{rfprofile = TRUE} to
  add the style.R to the .Rprofile for sourcing upon
  startup.  Otherwise, the user must open the style.R as
  the active tab in RStudio, check the `Source on Save` box
  and the click the save icon.
}
\references{
  \url{http://www.rstudio.com/ide/docs/authoring/markdown_custom_rendering}
}

