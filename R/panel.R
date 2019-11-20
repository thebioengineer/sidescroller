#' Contain the contents of a panel
#' @description helper function for providing contents for multi-panel slides
#' @param ... contents of the panel
#' @param style panel css styling
#' @export

panel <- function(..., style = NULL){
   panel_div <- div( class = "panel" , style = style)
   panel_div <- tagAppendChildren(panel_div, ...)
   class(panel_div) <- c(class(panel_div),"panel")
   return(panel_div)
 }
 
#' Contain the contents of a panel written in markdown
#' @description helper function for providing contents for multi-panel slides, with the contents written in markdown
#' @param x character vector of contents written in markdown
#' @param style panel css styling
#' @export
panel_markdown <- function(x, style = NULL){
  panel_div <- div( class = "panel" , style = style, markdown_to_html(x))
  class(panel_div) <- c(class(panel_div),"panel")
  return(panel_div)
}

 
 is_panel <- function(x){
   "panel" %in% class(x)
 }
 
 