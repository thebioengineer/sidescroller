sidescrollDependencies <- function(){
  list(
    htmlDependency(
      "jquery",
      "1.11.0",
      system.file("htmlwidgets/jquery", package = "sidescroll"),
      script = c("jquery-1.11.0.min.js","jquery-migrate-1.2.1.min.js")),
    htmlDependency(
      "sidescroll",
      "1.0.0",
      system.file("htmlwidgets/sidescroll", package = "sidescroll"),
      script = c("sidescroll.js"),
      stylesheet = c("sidescroll.css")),
    htmlDependency(
      "slick",
      "1.8.1",
      system.file("htmlwidgets/slick", package = "sidescroll"),
      script = c("slick.min.js"),
      stylesheet = c("slick.css","slick-theme.css"))
  )

}

