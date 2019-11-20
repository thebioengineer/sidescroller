library(sidescroller)

example_scroller <- sidescroller() %>%
  
  title_slide(
    title = "This is the title of my awesome presentation",
    subtitle = c("Ellis Hughes","11/17/2019"),
    text_align = "left"
  )%>%
  
  slide(
    title = NULL,
    p("Oh Hello, world")
    ) %>%
  
  slide(
    "A now Visible Slide",
    tags$ol(
      tags$li("Item 1"),
      tags$li("item 2")
    )
    ) %>%
  
  slide(
    title = "Example of an image",
    img(src="https://66.media.tumblr.com/ee3deb2caceaa59c3dd0f80f82a37beb/tumblr_mpsej2j5rW1qz8x31o1_500.gifv")
  ) %>%
  
  slide_wide(
    title = "This is a wide slide",
    p("This slide will fill the width of the display"),
    p("The purpose could be to clear out the past display, or stage before the next section."),
    p("To clarify the area of the slide, it is colored `gray`."),
    style = "background: gray;"
  ) %>% 
  
  slide_markdown(
    title = "Markdown Slide",
    "Testing the markdown
     1. making
         - a list
         - is easy in markdown
         - but
     2. will it render??
     
     Because I like [links](https://www.google.com)!"
     ) %>% 
  
  slide_multipanel(
    title = "Multi-Panel Slide",
    panel(
      p("Contents 1"),
      img(src= "https://upload.wikimedia.org/wikipedia/commons/5/58/Fun._band.jpg")
      ),
    panel(img(src = "https://imgs.xkcd.com/comics/frequentists_vs_bayesians.png")),
    panel_markdown(
      "markdown_to_html() also works here
      Isn't that *cool*?
      - This enables you to:
          - make a point
      - and progress through the
          - story to maintaing continuity

      ```{r}
      print(\"Hello World\")
      ```"
    )
  ) %>% 
  slide_markdown(
    title = "Super long title. like how is it soooo long. holy cow. when will it loop back??",
    "Lorem markdownum credas posset illa solvit, circumspice funesta fixa iacebat
nomine, nisi ferae. Parvo ramis rudi summaque *nova*, nam et est celate, sed,
haerent tellus nymphae sua. Cecidit adstitit est [Romam
defixa](http://www.primo.net/diva-sua.html) iam Bybli sub natalis herbis.
Praeceps pectus longum iacit et quin vagantem pocula suspirat oblectamina caput
censu dat quid dixerat fera. Oraque exul.

1. Inattenuata mater
2. Habebat templa perquirere cornua
3. Non Erinys dumque Melas tantum potens suam
4. Erit natus circumlita contigit incertas via oras
5. Canori me tonitrus dabat rastrique inque nox
6. Frena spoliata dubitaret similis hostem frustraque non"
  ) %>% 
  
  slide_multipanel( 
    title = "Multi-Panel Slide with a title that goes on and on my fiends. It is a title that never ends. On and on it goes. where it stops, who knows?",
    panel(
      p("Contents 1"),
      img(src= "https://upload.wikimedia.org/wikipedia/commons/5/58/Fun._band.jpg")
    ),
    panel(img(src = "https://imgs.xkcd.com/comics/frequentists_vs_bayesians.png")),
    panel_markdown(
      "markdown_to_html() also works here
      Isn't that *cool*?
      - This enables you to:
          - make a point
      - and progress through the
          - story to maintaing continuity

      ```{r}
      print(\"Hello World\")
      ```"
    ),
    style = "background: light-blue;",
    panel_style = "margin-top: 100px;"
  )

temp_html <- tempfile(fileext = ".html")

save_sidescroller(example_scroller,temp_html)
rstudioapi::viewer(temp_html)


