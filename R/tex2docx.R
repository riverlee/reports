#' Convert tex/markdown/html to docx/tex/html
#'
#' Use \href{pandoc}{http://johnmacfarlane.net/pandoc/} to convert
#' tex/markdown/html to docx (or tex/html) for those colleagues who use docx.
#'
#' @param in.file A character vector of the tex/md file.
#' @param out.file A character vector of the outfile.  If \code{"replace"} over
#' writes the original HTML file.  Default, \code{NULL}, uses the root name of
#' the \code{in.file} plus a number 2.
#' @param path The path to where the documents reside/should be created.
#' Default is the REPORT directory.  This conveniently allows for non paths to
#' be supplied to \code{in.file} and \code{out.file} (i.e., just the file
#' names).  Paths can be supplied to \code{in.file} and \code{out.file} by
#' setting \code{path} to \code{NULL}.
#' @param bib.loc Optional path to a .bib resource.
#' @details The user must have pandoc installed and on their path.  pandoc can
#' be installed from: \cr \href{http://johnmacfarlane.net/pandoc/installing.html}{http://johnmacfarlane.net/pandoc/installing.html}
#' @note \code{md2docx}, \code{md2tex} and \code{md2pdf} converts markdown
#' (a .md file) not Rmarkdown (.Rmd).  Use knitr to knit to HTML first (this
#' creates the .md file).
#' @rdname doc2doc
#' @export
#' @importFrom tools file_ext
#' @examples
#' \dontrun{
#' DOC <- system.file("extdata/doc_library/apa6.qual_tex/doc.tex",
#'    package = "reports")
#' BIB <- system.file("extdata/docs/example.bib", package = "reports")
#' tex2docx(DOC, file.path(getwd(), "test.docx"), path = NULL, bib.loc = BIB)
#' }
tex2docx <-
function(in.file = NULL, out.file = NULL, path = paste0(getwd(), "/REPORT"),
    bib.loc = getOption("bib.loc")) {
    if (!is.null(path)) {
        WD <- getwd()
        on.exit(setwd(WD))
        setwd(path)
        if (is.null(in.file)) {
            in.file <- dir(path)[file_ext(dir(path)) == "tex"]
            in.file <- in.file[!in.file %in% "preamble.tex"][1]
        }
        if (is.null(out.file)) {
            out.file <- paste0(unlist(strsplit(in.file, "\\."))[1], ".docx")
        }
    }
    action <- paste0(wheresPandoc(), " -s ", shQuote(in.file), " -o ", shQuote(out.file))
    if (!is.null(bib.loc)) {
        action <- paste0(action, " --bibliography=", shQuote(bib.loc))
    }
    system(action)
    cat("docx file generated!\n")
}

#' @rdname doc2doc
#' @export
tex2html <-
function(in.file = NULL, out.file = NULL, path = paste0(getwd(), "/REPORT"),
    bib.loc = getOption("bib.loc")) {
    if (!is.null(path)) {
        WD <- getwd()
        on.exit(setwd(WD))
        setwd(path)
        if (is.null(in.file)) {
            in.file <- dir(path)[file_ext(dir(path)) == "tex"]
            in.file <- in.file[!in.file %in% "preamble.tex"][1]
        }
        if (is.null(out.file)) {
            out.file <- paste0(unlist(strsplit(in.file, "\\."))[1], ".html")
        }
    }
    action <- paste0(wheresPandoc(), " -s ", shQuote(in.file), " -o ", shQuote(out.file))
    if (!is.null(bib.loc)) {
        action <- paste0(action, " --bibliography=", shQuote(bib.loc))
    }
    system(action)
    cat("html file generated!\n")
}

#' @rdname doc2doc
#' @export
md2docx <-
function(in.file = NULL, out.file = NULL, path = paste0(getwd(), "/REPORT"),
    bib.loc = getOption("bib.loc")) {
    if (!is.null(path)) {
        WD <- getwd()
        on.exit(setwd(WD))
        setwd(path)
        if (is.null(in.file)) {
            in.file <- dir(path)[file_ext(dir(path)) %in% "md"]
        }
        if (is.null(out.file)) {
            out.file <- paste0(unlist(strsplit(in.file, "\\."))[1], ".docx")
        }
    }
    action <- paste0(wheresPandoc(), " -s ", shQuote(in.file), " -o ", shQuote(out.file))
    if (!is.null(bib.loc)) {
        action <- paste0(action, " --bibliography=", shQuote(bib.loc))
    }
    system(action)
    cat("docx file generated!\n")
}

#' @rdname doc2doc
#' @export
md2tex <-
function(in.file = NULL, out.file = NULL, path = paste0(getwd(), "/REPORT"),
    bib.loc = getOption("bib.loc")) {
    if (!is.null(path)) {
        WD <- getwd()
        on.exit(setwd(WD))
        setwd(path)
        if (is.null(in.file)) {
            in.file <- dir(path)[file_ext(dir(path)) %in% "md"]
        }
        if (is.null(out.file)) {
            out.file <- paste0(unlist(strsplit(in.file, "\\."))[1], ".tex")
        }
    }
    action <- paste0(wheresPandoc(), " -s ", shQuote(in.file), " -o ", shQuote(out.file))
    if (!is.null(bib.loc)) {
        action <- paste0(action, " --bibliography=", shQuote(bib.loc))
    }
    system(action)
    cat("tex file generated!\n")
}

#' @rdname doc2doc
#' @export
md2pdf <-
function(in.file = NULL, out.file = NULL, path = paste0(getwd(), "/REPORT"),
    bib.loc = getOption("bib.loc")) {
    if (!is.null(path)) {
        WD <- getwd()
        on.exit(setwd(WD))
        setwd(path)
        if (is.null(in.file)) {
            in.file <- dir(path)[file_ext(dir(path)) == "md"]
            in.file <- in.file[!in.file %in% "preamble.tex"][1]
        }
        if (is.null(out.file)) {
            out.file <- paste0(unlist(strsplit(in.file, "\\."))[1], ".pdf")
        }
    }
    action <- paste0(wheresPandoc(), " -s ", shQuote(in.file), " -o ", shQuote(out.file))
    if (!is.null(bib.loc)) {
        action <- paste0(action, " --bibliography=", shQuote(bib.loc))
    }
    system(action)
    cat("pdf file generated!\n")
}

#' @rdname doc2doc
#' @export
html2pdf <-
function(in.file = NULL, out.file = NULL, path = paste0(getwd(), "/REPORT"),
    bib.loc = getOption("bib.loc")) {
    if (!is.null(path)) {
        WD <- getwd()
        on.exit(setwd(WD))
        setwd(path)
        if (is.null(in.file)) {
            in.file <- dir(path)[file_ext(dir(path)) == "html"]
            in.file <- in.file[!in.file %in% "preamble.tex"][1]
        }
        if (is.null(out.file)) {
            out.file <- paste0(unlist(strsplit(in.file, "\\."))[1], ".pdf")
        }
    }
    action <- paste0(wheresPandoc(), " -s ", shQuote(in.file), " -o ", shQuote(out.file))
    if (!is.null(bib.loc)) {
        action <- paste0(action, " --bibliography=", shQuote(bib.loc))
    }
    system(action)
    cat("pdf file generated!\n")
}
