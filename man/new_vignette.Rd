\name{new_vignette}
\alias{append_vignette}
\alias{new_vignette}
\title{Vignette Template}
\usage{
  new_vignette(vignette = "vignette", type = "rmd",
    path = getwd(), bib.loc = NULL,
    name = getOption("name.reports"), open = FALSE)

  append_vignette(vignette = "vignette", type = "rmd",
    path = getwd(), bib.loc = NULL,
    name = getOption("name.reports"))
}
\arguments{
  \item{vignette}{A character string of the vignette name
  (subdirectories of the main directory, "vignettes", will
  utilize this string).  The function
  \code{append_vignette} will create an additional vignette
  with this name in the vignettes directory.}

  \item{type}{A character string of either \code{"rmd"} or
  \code{"rnw"}.}

  \item{path}{The path to where the project should be
  created.  Default is the current working directory.
  Suggest setting to the package root directory. If using
  the function \code{append_vignette} this is the path to
  the current vignettes directory.}

  \item{bib.loc}{Optional path to a .bib resource.}

  \item{name}{A character string of the user's name to be
  used on the vignette.}

  \item{open}{logical.  If \code{TRUE} the project will be
  opened in RStudio.}
}
\value{
  Creates a vignette template.
}
\description{
  \code{new_vignette} - Generate a vignettes template to
  increase efficiency.

  \code{append_vignette} - Add vignettes to a pre-existing
  vignettes directory.
}
\section{Suggestion}{
  The user may want to set \code{\link[base]{options}} for
  \code{bib.loc}, \code{name.reports} in the user's primary
  \code{.Rprofile}: \enumerate{ \item{\bold{bib.loc} - The
  path to the users primary bibliography}
  \item{\bold{name.reports} - The name to use on reports} }
}
\examples{
## new_vignette()
}
\references{
  \url{http://yihui.name/knitr/demo/vignette/}

  \url{http://cran.r-project.org/doc/manuals/r-devel/R-exts.html#Writing-package-vignettes}
}
\seealso{
  \code{\link[utils]{browseVignettes}}
}

