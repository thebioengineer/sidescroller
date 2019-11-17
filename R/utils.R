sidescrollDependencies <- function(){
  list(
    htmlDependency(
      "jquery",
      "1.11.0",
      system.file("htmlwidgets/jquery", package = "sidescroller"),
      script = c("jquery-1.11.0.min.js","jquery-migrate-1.2.1.min.js")),
    htmlDependency(
      "sidescroll",
      "1.0.0",
      system.file("htmlwidgets/sidescroll", package = "sidescroller"),
      script = c("sidescroll.js"),
      stylesheet = c("sidescroll.css")),
    htmlDependency(
      "slick",
      "1.8.1",
      system.file("htmlwidgets/slick", package = "sidescroller"),
      script = c("slick.min.js"),
      stylesheet = c("slick.css","slick-theme.css"))
  )

}

#' Save the sidescroller object
#' @description Utility to save the sidescroller object
#' @inheritParams htmltools::save_html
#' @export
save_sidescroller <- function(x,file,background = "#313131", libdir = "lib"){
  save_html( x, file, background = background, libdir = libdir )
}
