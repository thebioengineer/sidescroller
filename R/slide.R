
#' Generic Slide Creation
#' @description helper function for creating slides. Intended for use within other functions
#' @param x a sidescroller object
#' @param ... tag elements to be added to the slide
#' @param style style to be passed to the slide
#' @param visibility Should the slide default to be visible before sliding over. Defaults to false
#' @param slide_id set the slide id for css
#' @param slide_class set the slide class for css
#' @param container_class set the class slide container class for css
#' @export
#' @examples 
#' x <- sidescroller() %>% 
#'     slide_base(h1("This is a new slide),br(),p("This is some slide contents"), background = "#111111")
#' 

slide_base <- function(x, ..., style = NULL, visibility = FALSE, slide_id = "generic", slide_class = "generic", container_class = "fit_content"){

  stopifnot(is_sidescroller(x))
  
  if(visibility){
    slide_style <- "visibility:visible;"
  }else{
    slide_style <- "visibility:hidden;"
  }

  if(!is.null(style)){
    slide_style <- paste0(slide_style, style)
  }

  slide_contents <- div(
    div(class=paste(c("slide_container",container_class),collapse=" "), style = slide_style,
        div(class = paste(slide_class, collapse = " ") ,id= paste(slide_id, collapse = " "),
            ...
        )
    )
  )

  x$children[[length(x$children)]] <-
    tagAppendChild(x$children[[length(x$children)]],slide_contents)

  x
}

