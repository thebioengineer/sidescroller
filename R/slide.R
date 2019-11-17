
slide <- function(x, ..., slide_id = "generic", slide_class = "generic", visibility = TRUE, background = NULL){

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
        div(class = slide_class,id= slide_id,
            ...
        )
    )
  )

  x$children[[length(x$children)]] <-
    tagAppendChild(x$children[[length(x$children)]],slide_contents)

  x
}
