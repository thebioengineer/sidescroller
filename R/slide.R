
#' Generic Slide Creation
#' @description helper function for creating slides. Intended for use within other functions
#' @param x a sidescroller object
#' @param ... tag elements to be added to the slide
#' @param background What color should the background of the slide be
#' @param visibility Should the slide default to be visible before sliding over. Defaults to false
#' @param slide_id set the css slide id
#' @param slide_class set the css slide class
#' @export
#' @examples 
#' x <- sidescroller() %>% 
#'     slide_base(h1("This is a new slide),br(),p("This is some slide contents"), background = "#111111")
#' 

slide_base <- function(x, ..., background = NULL, visibility = FALSE, slide_id = "generic", slide_class = "generic"){

  stopifnot(is_sidescroller(x))
  
  if(visibility){
    slide_style <- "visibility:visible;"
  }else{
    slide_style <- "visibility:hidden;"
  }

  if(!is.null(background)){
    slide_style <- paste0(slide_style," background:", background,";")
  }


  slide_contents <- div(
    div(class="slide_container", style = slide_style,
        div(class = paste(slide_class, collapse = " ") ,id= paste(slide_id, collapse = " "),
            ...
        )
    )
  )

  x$children[[length(x$children)]] <-
    tagAppendChild(x$children[[length(x$children)]],slide_contents)

  x
}

