
#' @title convert markdown text to html
#' @details A tool for converting passed text in RMD format into html for a slide
#' @importFrom rmarkdown render html_document
#' @importFrom rvest html_nodes
#' @importFrom xml2 read_html
#' @importFrom htmltools HTML
#' @export
markdown_to_html <- function(x){
  stopifnot(is.character(x))

  temp_md <- tempfile(tmpdir = ".",fileext = ".Rmd")
  temp_html <- tempfile(tmpdir = ".",fileext = ".html")
  content <- left_justify(strsplit(x,"\\n")[[1]])
  # content <- strsplit(x,"\\n")[[1]]
  
  writeLines(c("---","title: md_to_text","---",content),temp_md, sep = "\n")

  quiet <- capture.output( {pandoc_output <- try( suppressMessages(
    rmarkdown::render(temp_md,temp_html,output_format = rmarkdown::html_document())
    ), silent = TRUE) })

  if (inherits(pandoc_output,"try-error") ) {
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

left_justify <- function(text){
  left_whitespace <- NA
  for(line in text[-1]){
      if(line != ""){
        ws<- gsub("^(\\s*)(.*)","\\1",line)
        if(is.na(left_whitespace) | nchar(ws) < nchar(left_whitespace)){
          left_whitespace <- ws
        }
      }
  }

  if(nchar(left_whitespace)>0){
    gsub(paste0("^",left_whitespace),"",text,perl=TRUE)
  }else{
    text
  }
}
