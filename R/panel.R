#' Contain the contents of a panel
#' @description helper function for providing contents for multi-panel slides
#' @param ... contents of the panel
#' @export

panel <- function(...){
   panel_div <- div( class = "panel" )
   panel_div <- tagAppendChildren(panel_div, ...)
   class(panel_div) <- c(class(panel_div),"panel")
   return(panel_div)
 }
 
 
 is_panel <- function(x){
   "panel" %in% class(x)
 }