#set page(
  numbering: "1",
  number-align: center,
  )

#set heading(numbering: "1.")
#set par(justify: true)
#set text(
  font: "Helvetica",
)

#show "__GHOST_URL__": "https://internetfreedom.in"
#show "GHOST_URL/": "https://internetfreedom.in"

#align(center, text(18pt)[
  *Internet Freedom Foundation* \
  New Delhi, India
])

#align(center+horizon,[
  #image("logo.png", width: 50%)
])

#align(bottom+center)[
  #set par(justify: false)
  *Last Update at: Sun Jun  2 19:53:33 EEST 2024 * \

  This document is an attempt to create a print-friendly archive of the entirety of content publically available at \ https://internetfreedom.in.
]


#pagebreak()

#outline()

#pagebreak()

#let p(post) = [
  == #post.title
  
  #v(2pt)
  
  *published on* =  #post.published_at

  #post.plaintext

  #pagebreak()
]

#let ghostToPDF(db) = [

= Posts
#for (post) in (db.db.at(0).data.posts) {
  if (post.visibility == "public" and post.type == "post" and post.status != "draft") {
    p(post)
  }
}

= Pages
#for (post) in (db.db.at(0).data.posts) {
  if (post.visibility == "public" and post.type == "page" and post.status != "draft") {
    p(post)
  }
}
]

#ghostToPDF(json("iff.json"))
