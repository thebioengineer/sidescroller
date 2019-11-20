#' Basic Slide with title and contents
#' @description basic slide with title and contents
#' @param .x a sidescoller object
#' @param title pass a title for the slide
#' @param ... html content to create slide
#' @param style style to be passed to the slide container
#' @export
#' @examples
#' sidescroller() %>% 
#'     slide(
#'     title = "Markdown Example Slide",
#'     p("This content will be rendered")
#'     p("as html content.")
#'     )
slide <- function(.x, title = NULL, ... , style = NULL){
  
  slide_title <- div(class = "single_panel_title_box title_box")
  
  if(!is.null(title)){
    slide_title <- tagAppendChild(
      slide_title,
      div(class = "slide_title",h1(title))
    )
  }
  
  slide_base(.x, slide_title, panel(...), style = style , slide_class = c("single_panel","generic"))
}


#' Slide based on Markdown text
#' @description create slide contents based on markdown
#' @param .x a sidescoller object
#' @param title pass a title for the slide
#' @param content a scalar character vector with contents formatted as markdown
#' @param ... arguments to be passed to \code{\link[sidescroller]{slide_base}}
#' @param style style to be passed to the slide container
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
slide_markdown <- function(.x, title = NULL, content,  ..., style = NULL){
  
  slide_title <- div(class = "single_panel_title_box title_box")
  
  if(!is.null(title)){
    slide_title <- tagAppendChild(
      slide_title,
      div(class = "slide_title",h1(title))
    )
  }
  
  slide_base(.x, slide_title, panel(markdown_to_html(content)), ..., style = style, slide_class = c("single_panel","generic"))
}


#' Slide made to fill entire screen
#' @description Make a full width slide
#' @param .x a side scroller object
#' @param title title of the slide
#' @param ... slide contents
#' @param style style to be passed to the slide container
#' @export
#' @examples
#' sidescroller() %>% 
#'    slide_wide(
#'      title = "This is a wide slide",
#'      p("This slide will fill the width of the display"),
#'      p("The purpose could be to clear out the past display, or stage before the next section")
#'      )

slide_wide <- function(.x, title = NULL, ..., style = NULL){
  
  slide_title <- div(class = "single_panel_title_box title_box")
  
  if(!is.null(title)){
    slide_title <- tagAppendChild(
      slide_title,
      div(class = "slide_title",h1(title))
    )
  }
  
  slide_base(.x, slide_title, panel(...), slide_class = c("full_width", "single_panel","generic"), style = style)
}

#' Slide made to fill entire screen
#' @description Make a full width slide
#' @param .x a side scroller object
#' @param title title of the slide
#' @param x slide contents written in markdown
#' @param style style to be passed to the slide container
#' @export
#' @examples
#' sidescroller() %>% 
#'    slide_wide_markdown(
#'      title = "This is a wide slide based on markdown",
#'      "This slide will fill the width of the display.
#'       The purpose could be to clear out the past display, or stage before the next section.
#'       The Conents is written in _markdown_.")
#'      )

slide_wide_markdown <- function(.x, title = NULL, x, style = NULL){
  
  slide_title <- div(class = "single_panel_title_box title_box")
  
  if(!is.null(title)){
    slide_title <- tagAppendChild(
      slide_title,
      div(class = "slide_title",h1(title))
    )
  }
  
  slide_base(.x, slide_title, panel(markdown_to_html(x)), slide_class = c("full_width", "single_panel", "generic"), style = style)
}

#' Slide made up of multiple panels
#' @description A slide that is built of multiple panels to progess a story under a single title
#' @param .x a side scroller object
#' @param title title of the slide
#' @param ... panels of slide contents
#' @param style style to be passed to the slide container
#' @param panel_style style to be passed to the panels within the slide
#' @export
#' @examples
#' sidescroller() %>% 
#'    slide_multipanel(
#'      title = "This is a multipanel slide",
#'      panel("This slide will progress with contents all at the same level."),
#'      panel("Tnis helps show the progression of the story.")
#'      panel("And tie together the points.")
#'      )

slide_multipanel <- function(.x, title = NULL, ... , style = NULL, panel_style = NULL){
  
  slide_title <- div(class = "multi_panel_title_box title_box")
  
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
  
  if(!is.null(panel_style)){
    panels <- lapply( panels, function(p){
      tagAppendAttributes(
        p,
        style = paste0(c(tagGetAttribute(p,"style"),panel_style),collapse=";")
      )
    })
  }

  .x <- slide_base(.x, slide_title, panels[[1]] , slide_class = c("multi_panel","generic"), container_class = NULL , style = style )

  for( m_panel in panels[-1]){
    .x <- slide_base(.x, m_panel , slide_class = c("multi_panel","generic") , container_class = NULL , style = style)
  }

  return(.x)
}
