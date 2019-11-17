
example_scroller <- sidescroller() %>%
  title_slide(
    title = "This is the title of my awesome presentation",
    subtitle = c("Ellis Hughes","11/17/2019"),
    text_align = "left"
    )%>%
  slide(p("Oh Hello, world"), visibility = FALSE) %>%
  slide(tags$ol(
    tags$li("Item 1"),
    tags$li("item 2")
    ),
    visibility = FALSE) %>%
  slide(
    div(style = "width:200px",
    div(class="tenor-gif-embed",
            "data-postid"="13983336",
            "data-share-method"="host",
            "data-width"="100%",
            "data-aspect-ratio"="1.3555555555555556",
            a( href="https://tenor.com/view/zoidberg-dr-futurama-lila-thats-why-we-love-you-gif-13983336",
               "Zoidberg Dr GIF"),
            "from",
            a (href="https://tenor.com/search/zoidberg-gifs",
               "Zoidberg GIFs")
          ),
        tags$script(type="text/javascript",src="https://tenor.com/embed.js")),
    visibility=FALSE) %>%
  markdown_slide("
        ## this is a test
        of the system
        _to generate_
        *html outputs*
        onthefly",
        visibility=FALSE) %>%
  markdown_slide("
            ## New slide header
            Testing the markdown
            1. making
              - a list
              - is easy in markdown
              - but
            2. will it render??

            Because I like [links](https://www.google.com)!
            ")

save_sidescroller(example_scroller,"test.html")
