library(htmltools)

# Used for local committee
person_info <- function(name = "A Person",
                        affiliation = "Role\nInstitution",
                        pic = "media/reshot-icon-human-person-6P2MCTEQ95.svg",
                        alt = "Generic person icon",
                        website = NULL,
                        email = NULL){
  res <- list(img(src = pic, alt = alt, style = "width:55%"),
              paste('<br/><b>', name, '</b>'),
              paste('<br/>', affiliation, '<br/>'))
  if (!is.null(website)){
    link <- a(img(src = "media/reshot-icon-link-TPKSVGQNXF.svg", height = "30",
                  style = "margin:2px; vertical-align:middle;", border = "0"),
              href = website, target = "_blank", style = "text-decoration:none")
    res <- c(res, list(link))
    
  }
  if (!is.null(email)){
    link <- a(img(src = "media/reshot-icon-email-P9WA8LS724.svg", 
                  height = "30", style = "margin:2px; vertical-align:middle;", border = "0"),
              href = paste0("mailto:", email))
    res <- c(res, list(link))
  }
  cat(vapply(res, as.character, character(1)), sep = "\n")
}

# Used for participant list
# https://github.com/shafayetShafee/bsicons
participant_info <- function(name = "A Person",
                             affiliation = NULL,
                             pic = "/media/reshot-icon-human-person-6P2MCTEQ95.svg",
                             alt = "Generic person icon",
                             link = NULL, # main website
                             github = NULL,
                             mastodon = NULL,
                             twitter = NULL,
                             linkedin = NULL){
  res <- list(img(src = pic, alt = alt, style = "width:55%"))
  if (!is.null(link)){
    res <- c(res, 
             list(paste('<br/>', a(name, href = website, target = "_blank", 
                                   style = "text-decoration:none"), '</b>')))
  } else {
    res <- c(res, list(paste('<br/><b>', name, '</b>')))
  }
  if (!is.null(affiliation)) {
    res <- c(res, list(paste('<br/>', affiliation, '<br/>')))
  }
  links <- c("link", "linkedin", "mastodon", "twitter", "github")
  for (x in links) {
    if (!is.null(get(x))){
      hyperlink <- a(paste('{{< bi', x, ' size=5em color=#2ecaf9 >}}'),
                     href = get(x), target = "_blank", 
                     style = "text-decoration:none")
      res <- c(res, list(hyperlink))
    }
  }
  cat(vapply(res, as.character, character(1)), sep = "\n")
}
