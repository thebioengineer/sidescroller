title_slide <- function(x,title = NULL,author = NULL, ... ){

  if(!is.null(title)){
    title <- p( title, class="title_text", style="z-index:1000")
  }

  if(!is.null(author)){
    author <- p( author, class="subtitle_text")
  }

  slide(x, title, author, ... )
}



slide <- function(x, ..., slide_id = "generic", slide_class = "generic", visibility = TRUE){

  if(visibility){
    slidevis <- "visibility:visible"
  }else{
    slidevis <- "visibility:hidden"
  }

   slide_contents <- div(
    div(class="slide_container", style=slidevis,
      div(class = slide_class,id= slide_id,
          ...
      )
    )
  )

  tagAppendChild(x,slide_contents)
}
