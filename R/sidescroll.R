
#' @title Side Scroller Initializer
#' Initialize a Side Scroller
#' @description  initialize a side scroller object
#' @import htmltools
#' @export
#' @examples
#' x <- sidescroller()
sidescroller<- function(){

  slide_master <- div(class = "slide_master_wrapper",div(class="slide_master"))

  slide_master <- htmltools::attachDependencies(
    slide_master, sidescrollDependencies()
  )

  class(slide_master)<-c(class(slide_master),"sidescroller")

  slide_master
}


#' Check if is a side scroller object
#' @param x object to be checked if it is a side scroller
#' @export
#' @examples
#' x <- sidescroller()
#' is_sidescroller(x)
is_sidescroller <- function(x){
  "sidescroller" %in% class(x)
}




