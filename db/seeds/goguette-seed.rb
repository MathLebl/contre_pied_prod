puts "Creating Les Goguettes"

artist = Artist.new(
category: "spectacle",
name: "Les Goguettes",
description: "Les Goguettes ce sont : 3 auteurs-interprètes, 1 pianiste, des centaines de parodies, près de 30.000 spectateurs, plus de 300 spectacles dans toute la France, près de 10 millions de vues sur leur chaîne YouTube, 290 ampoules de 15 watts chacune sur scène, 2 triomphes au Festival d’Avignon, une douzaine de cravates noires un peu usées et au moins 3 blagues sur Krasucki.",
style: "Théâtre musical / humour" ,
video: "https://www.youtube.com/embed/BFOJtRFlY-8",
spotify: "https://open.spotify.com/artist/2UY8y4AIZuD83AxhtIyRT2",
youtube: "https://www.youtube.com/channel/UCL95UhlTaJ5YNJczY5I-X5A",
insta: "https://www.instagram.com/lesgoguettes/",
twitter: "https://twitter.com/Les_Goguettes",
facebook: "https://www.facebook.com/lesgoguettes/",
user_id: 1
  )
artist.image.attach(
  io: File.open("app/assets/images/goguette/goguette-dice3.jpg"),
  filename: "goguette-dice3.jpg"
  )
artist.banner_image.attach(
  io: File.open("app/assets/images/goguette/goguette-dice3.jpg"),
  filename: "goguette-dice3.jpg"
  )
artist.show_image1.attach(
  io: File.open("app/assets/images/goguette/goguette-dice3.jpg"),
  filename: "goguette-dice3.jpg"
  )
artist.show_image2.attach(
  io: File.open("app/assets/images/goguette/goguette-dice3.jpg"),
  filename: "goguette-dice3.jpg"
  )
artist.show_image3.attach(
  io: File.open("app/assets/images/goguette/goguette-dice3.jpg"),
  filename: "goguette-dice3.jpg"
  )
artist.show_image4.attach(
  io: File.open("app/assets/images/goguette/goguette-dice3.jpg"),
  filename: "goguette-dice3.jpg"
  )
artist.save!
 puts "Goguette done"
