#' Slide based on Markdown text
#' @description create slide contents based on markdown
#' @param x a sidescoller object
#' @param title pass a title for the slide
#' @param content a scalar character vector with contents formatted as markdown
#' @param ... arguments to be passed to \code{\link[sidescroller]{slide_base}}
#' @export
#' @examples
#' sidescroller() %>% 
#'     slide_markdown(title = "Markdown Example Slide",
#'     "This content will be rendered
#'     as _markdown_ content.
#'     New lines are respected.
#'     1. This allows
#'         - for users to pass
#'         - human readable markdown text
#'     2. And it will be rendered as
#'        - html!"
#'     )
slide_markdown <- function(x, title = NULL, content,  ...){
  
  slide_title <- div(class = "single_panel_title_box")
  
  if(!is.null(title)){
    slide_title <- tagAppendChild(
      slide_title,
      div(class = "slide_title",h1(title))
    )
  }
  
  slide_base(x, slide_title, markdown_to_html(content), ...)
}


#' Slide made to fill entire screen
#' @description Make a full width slide
#' @param x a side scroller object
#' @param title title of the slide
#' @param ... slide contents and arguments to be passed to \code{\link[sidescroller]{slide_base}}
#' @export
#' @examples
#' sidescroller() %>% 
#'    slide_wide(
#'      title = "This is a wide slide",
#'      p("This slide will fill the width of the display"),
#'      p("The purpose could be to clear out the past display, or stage before the next section")
#'      )

slide_wide <- function(x, title = NULL, ...){
  
  slide_title <- div(class = "single_panel_title_box")
  
  if(!is.null(title)){
    slide_title <- tagAppendChild(
      slide_title,
      div(class = "slide_title",h1(title))
    )
  }
  
  slide_base(x, slide_title, ..., slide_class = c("full_width","generic"))
}

#' Slide made up of multiple panels
#' @description A slide that is built of multiple panels to progess a story under a single title
#' @param x a side scroller object
#' @param title title of the slide
#' @param ... panels of slide contents
#' @export
#' @examples
#' sidescroller() %>% 
#'    slide_multipanel(
#'      title = "This is a multipanel slide",
#'      panel("This slide will progress with contents all at the same level."),
#'      panel("Tnis helps show the progression of the story.")
#'      panel("And tie together the points.")
#'      )

slide_multipanel <- function(x, title = NULL, ... ){
  
  slide_title <- div(class = "multi_panel_title_box")
  
  if(!is.null(title)){
    slide_title <- tagAppendChild(
      slide_title,
      div(class = "slide_title",h1(title))
    )
  }
  
  panels <- list(...)
  
  if(!all(sapply(panels, is_panel))){
    stop("Not all entries to `slide_multipanel()` are `panels`.")
  }
  
  x <- slide_base(x, slide_title, panels[[1]] , slide_class = c("multi_panel","generic") )
  
  for( panel in panels[-1]){
    x <- slide_base(x, div(class = "multi_panel_title_box"), panel , slide_class = c("multi_panel","generic")) 
  }
  
  return(x)
}
