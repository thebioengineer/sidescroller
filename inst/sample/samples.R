
example_scroller <- sidescroller() %>%
  title_slide("TITLE","Author") %>%
  slide(p("Oh Hello, world")) %>%
  slide(tags$ol(
    tags$li("Item 1"),
    tags$li("item 2")
  ))

save_html(example_scroller,"test.html")
