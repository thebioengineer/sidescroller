#' Slide based on Markdown text
#' @description create slide contents based on markdown
#' @param x a sidescoller object
#' @param content a scalar character vector with contents formatted as markdown
#' @param title pass a title for the slide
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
slide_markdown <- function(x, content, title = NULL, ...){
  
  slide_content <- div()
  
  if(!is.null(title)){
    slide_content <- tagAppendChild(
      slide_content,
      div(class = "slide_title",h1(title))
    )
  }
  
  slide_content <- tagAppendChild(
    slide_content,
    markdown_to_html(content)
  )
  
  slide_base(x, slide_content, ...)
}


#' Slide made to fill entire screen
#' @description Make a full width slide
#' @param x a side scroller object
#' @param ... slide contents and arguments to be passed to \code{\link[sidescroller]{slide_base}}
#' @param title title of the slide
#' @export
#' @examples
#' sidescroller() %>% 
#'    slide_wide(
#'      title = "This is a wide slide",
#'      p("This slide will fill the width of the display"),
#'      p("The purpose could be to clear out the past display, or stage before the next section")
#'      )

slide_wide <- function(x, ..., title = NULL){
  
  slide_title <- div()
  
  if(!is.null(title)){
    slide_title <- tagAppendChild(
      slide_title,
      div(class = "slide_title",h1(title))
    )
  }
  
  slide_base(x, slide_title, ..., slide_class = c("full_width","generic"))
}

