% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/slide_ext.R
\name{slide_markdown}
\alias{slide_markdown}
\title{Slide based on Markdown text}
\usage{
slide_markdown(.x, title = NULL, content, ..., style = NULL)
}
\arguments{
\item{.x}{a sidescoller object}

\item{title}{pass a title for the slide}

\item{content}{a scalar character vector with contents formatted as markdown}

\item{...}{arguments to be passed to \code{\link[sidescroller]{slide_base}}}

\item{style}{style to be passed to the slide container}
}
\description{
create slide contents based on markdown
}
\examples{
sidescroller() \%>\% 
    slide_markdown(title = "Markdown Example Slide",
    "This content will be rendered
    as _markdown_ content.
    New lines are respected.
    1. This allows
        - for users to pass
        - human readable markdown text
    2. And it will be rendered as
       - html!"
    )
}
