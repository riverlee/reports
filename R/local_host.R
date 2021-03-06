#' Generate Local Host Bash/Batch
#' 
#' Create a .sh/.bat file to open a presentation with a local host. 
#' 
#' @param loc The path to the presentation directory.
#' @return Creates a .sh/.bat file that opens a local host to that directory.
#' @note The .sh/.bat file can not be opened from within RStudio.
#' @details The user must have \href{http://www.python.org/}{Python} installed 
#' and on their path to be able to utilize this function.  For more details see:
#' \url{http://www.youtube.com/watch?v=VlqpiKHz7Gw&feature=youtu.be}.
#' @keywords localhost
#' @author Dason Kurkiewicz and Tyler Rinker <tyler.rinker@@gmail.com>
#' @importFrom tools file_ext
#' @export
#' @examples
#' ## local_host()
local_host <- function(loc = file.path(getwd(), "PRESENTATION")) {
    OS <- Sys.info()["sysname"]
    ext <- "local_host.sh"
    if (OS == "Windows") {
    	bloc <- system.file("extdata/bash/win/local_host.bat", 
    	    package = "reports")
        ext <- "local_host.bat"
    } else {
    	if (OS == "Darwin") {
        	bloc <- system.file("extdata/bash/mac/local_host.sh", 
        	    package = "reports")    	
    	} else {
            if (OS == "Linux") {
                bloc <- system.file("extdata/bash/linux/local_host.sh", 
                    package = "reports")
            } else {
                warning(paste0("Operating system nust be Windows, Darwin or Linux:\n",
                    "local host not generated"))
                return(NULL)
            }
        }
    }
    script <- suppressWarnings(readLines(bloc))
    location <- grep("cd ALTER_PATH", script)
    script[location] <- paste("cd", loc)
    out <- file.path(loc, ext)
    cat(paste(script, collapse="\n"), file = out)
    message(paste0("To open a local host click:\n", out))
}

