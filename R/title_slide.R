title_slide <- function(x,title = NULL,author = NULL, ... ){

  if(!is.null(title)){
    title <- p( title, class="title_text", style="z-index:1000")
  }

  if(!is.null(author)){
    author <- p( author, class="subtitle_text")
  }

  slide(x, title, author, ... )
}
