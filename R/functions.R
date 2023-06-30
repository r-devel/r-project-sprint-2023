library(htmltools)

# Used for local committee
person_info <- function(name = "A Person",
                        affiliation = "Role\nInstitution",
                        pic = "media/reshot-icon-human-person-6P2MCTEQ95.svg",
                        alt = "Generic person icon",
                        website = NULL,
                        email = NULL){
  res <- list(img(src = pic, alt = alt, style = "width:55%"),
              paste('<br><b>', name, '</b>'),
              paste('<br>', affiliation, '<br>'))
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
                             web = NULL, # main website
                             link = NULL, # personal website
                             newspaper = NULL, #blog else newspaper
                             github = NULL,
                             mastodon = NULL,
                             twitter = NULL,
                             linkedin = NULL,
                             facebook = NULL,
                             orcid = NULL){
  res <- list(img(src = pic, alt = alt, style = "width:55%"))
  if (!is.null(web)){
    check_url(web)
    res <- c(res, 
             list(paste('<br>', a(name, href = web, target = "_blank", 
                                   style = "text-decoration:none"), '</b><br>')))
  } else {
    res <- c(res, list(paste('<br><b>', name, '</b><br>')))
  }
  if (!is.null(affiliation)) {
    res <- c(res, list(paste(affiliation, '<br>')))
  }
  links <- c("link", "newspaper", "linkedin", "facebook",
             "mastodon", "twitter", "github")
  for (x in links) {
    if (!is.null(get(x))){
      check_url(get(x))
      hyperlink <- a(paste('{{< bi', x, ' size=1.3em color=#000000 >}}'),
                     href = get(x), target = "_blank", 
                     style = "text-decoration:none")
      res <- c(res, list(hyperlink))
    }
  }
  if (!is.null(orcid)) {
    hyperlink <- a(img(src = "/media/ORCID-iD_icon-bw-vector.svg", 
                       alt = alt, style = "height:20px; margin-bottom:5px"),
                   href = orcid, target = "_blank", 
                   style = "text-decoration:none")
    res <- c(res, list(hyperlink))
  }
  cat(vapply(res, as.character, character(1)), sep = "\n")
}

check_url <- function(url) {
  if (!grepl("^https://", url)) stop(url, " does not begin with 'https://'")
}
