
example_scroller <- sidescroller() %>%
  title_slide("TITLE","Author") %>%
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
    visibility=FALSE)

save_html(example_scroller,"test.html")
