#' Create title slide for presentation
#' @details create a title slide for your presentation
#' @param x a side scoller object
#' @param title Title of the presentation
#' @param subtitle a character vector of subtitles to add
#' @param ... arguments to be passed to \code{\link[sidescroller]{slide_base}}
#' @param text_align Where should the title and subtitles be aligned? center, left or right.
#' @export
#' @examples
#' sidescroller() %>% 
#'    title_slide(
#'      title = "Sidescoller Presentation", 
#'      subtitle = "By Ellis Hughes")
title_slide <- function(x, title = NULL, subtitle = NULL, ... , text_align=c("center","left","right")){
  
  stopifnot(is_sidescroller(x))

  text_align <- match.arg(text_align)

  slide_title <- div( class = "slide_title_container" , style = paste0("text-align:",text_align,";"))

  if(!is.null(title)){
    slide_title <-
      tagAppendChild( slide_title,
                      h1(title, class="title_text", style="z-index:1000;"))
  }

  if(!is.null(subtitle)){
    for( sub in subtitle){
      slide_title <-
        tagAppendChild( slide_title,
                        p( sub, class="subtitle_text"))

    }
  }

  slide_base(x, slide_title , ... , slide_class = c("title_slide", "generic"), visibility = TRUE, style = "width:1600px")
}
