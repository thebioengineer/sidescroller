
#' @title Side Scroller Initializer
#' @details initialize a side scroller object
#' @param title define the title of the presentation
#' @param author define the auther of the presentation
#' @param ... HTML tags to add to head
#' @import htmltools
sidescroller<- function(){

  slide_master <- div(class = "slide_master_wrapper",div(class="slide_master"))

  slide_master <- htmltools::attachDependencies(
    slide_master, sidescrollDependencies()
  )

  class(slide_master)<-c(class(slide_master),"sidescroller")

  slide_master
}







