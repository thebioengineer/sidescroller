library(sidescroller)

example_scroller <- sidescroller() %>%
  title_slide(
    title = "This is the title of my awesome presentation",
    subtitle = c("Ellis Hughes","11/17/2019"),
    text_align = "left"
  )%>%
  slide_base(
    p("Oh Hello, world")
    ) %>%
  slide_base(
    p("This slide is by default visible due to `visibility = TRUE`"),
    tags$ol(
      tags$li("Item 1"),
      tags$li("item 2")
    ),
    visibility = TRUE) %>%
  slide_base(
    img(src="https://66.media.tumblr.com/ee3deb2caceaa59c3dd0f80f82a37beb/tumblr_mpsej2j5rW1qz8x31o1_500.gifv")
  ) %>%
  slide_wide(
    title = "This is a wide slide",
    p("This slide will fill the width of the display"),
    p("The purpose could be to clear out the past display, or stage before the next section."),
    p("To clarify the area of the slide, it is colored `gray`."),
    background = "gray"
  ) %>% 
  slide_markdown(
    title = "Markdown Slide",
    "
     ## New slide header
     Testing the markdown
     1. making
     - a list
     - is easy in markdown
     - but
     2. will it render??
     
     Because I like [links](https://www.google.com)!"
     ) %>% 
  slide_multipanel(
    title = "Multi-Panel Slide",
    panel(p("Contents 1")),
    panel(img(src = "https://imgs.xkcd.com/comics/frequentists_vs_bayesians.png")),
    panel(markdown_to_html(
      "
      markdown_to_html() also works here
      Isn't that *cool*?
      - This enables you to:
          - make a point
      - and progress through the
          - story to maintaing continuity
      "
    ))
  )

temp_html <- tempfile(fileext = ".html")

save_sidescroller(example_scroller,temp_html)
rstudioapi::viewer(temp_html)


