puts "Creating Les Goguettes"

artist = Artist.new(
name: "Les Goguettes",
description: "Les Goguettes ce sont : 3 auteurs-interprètes, 1 pianiste, des centaines de parodies, près de 30.000 spectateurs, plus de 300 spectacles dans toute la France, près de 10 millions de vues sur leur chaîne YouTube, 290 ampoules de 15 watts chacune sur scène, 2 triomphes au Festival d’Avignon, une douzaine de cravates noires un peu usées et au moins 3 blagues sur Krasucki.",
style: "théâtre musical / humour" ,
image: "goguette-image" ,
video: "https://www.youtube.com/watch?v=BFOJtRFlY-8",
spotify: "https://open.spotify.com/artist/2UY8y4AIZuD83AxhtIyRT2",
youtube: "https://www.youtube.com/watch?v=BFOJtRFlY-8",
insta: "https://www.instagram.com/lesgoguettes/",
twitter: "https://twitter.com/Les_Goguettes",
user_id: 1,
category: "Spectacle",
banner: "goguette/goguette-banner" ,
dice1: "goguette/goguette-dice1" ,
dice2: "goguette/goguette-dice2" ,
dice3: "goguette/goguette-dice3" ,
dice4: "goguette/goguette-dice4.JPG",
facebook: "https://www.facebook.com/lesgoguettes/",
distribution: ["Stan", "Clémence Monnier", "Valentin Vander", "Aurélien Merle"],
credits: ["Mise en scène : Yéshé Henneguelle", "Création lumière : Anne Muller", "Création sonore : Benoit Laur", "Costumes : Louisa Gesset-Hernandez", "Régie lumière Vincent Lemaitre", "Régie son : Christian Desille"],
partenaires: ["Rire et chansons", "20 minutes", "F2F Music"]
  )
artist.save!
 puts "Goguette done"
