
#' @title convert markdown text to html
#' @details A tool for converting passed text in RMD format into html for a slide
#' @importFrom rmarkdown render html_document
#' @importFrom rvest html_nodes
#' @importFrom xml2 read_html
#' @importFrom htmltools HTML
#' @export
markdown_to_html <- function(x){
  stopifnot(is.character(x))

  temp_md <- tempfile()
  temp_html <- tempfile(fileext = ".html")
  content <- left_justify(strsplit(x,"\\n")[[1]])

  writeLines(content,temp_md, sep = "\n\n")

  quiet <- capture.output(pandoc_output <-  try( suppressMessages(
    rmarkdown::render(temp_md,temp_html,output_format = rmarkdown::html_document())
    ), silent=TRUE))

  if(inherits(pandoc_output,"try-error")){
    pandoc_output
    stop("Pandoc conversion error")
  }else{

    html_content <- read_html(temp_html) %>%
      html_nodes(".main-container>:not(#header)") %>%
      as.character %>%
      paste(collapse="")


    unlink(temp_md)
    unlink(temp_html)

    HTML(html_content)
  }
}

left_justify <- function(x){
  first <- x[1]
  if(nchar(first)==0){
    iter <- 2
    while(nchar(first)==0){
      first <- x[iter]
      iter <- iter + 1
    }
  }

  left_whitespace  <- gsub("(\\s*)(.*)","\\1",first)
  gsub(left_whitespace,"",x)
}


markdown_to_html(
"this is a test
of the system
_to generate_
*html outputs*
onthefly
")
