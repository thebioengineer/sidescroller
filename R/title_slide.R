#' Create title slide for presentation
#' @details create a title slide for your presentation
#' @param x


title_slide <- function(x, title = NULL, subtitle = NULL, ... , text_align=c("center","left","right")){

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

  slide(x, slide_title , ... , slide_class = c("title_slide"))

}
