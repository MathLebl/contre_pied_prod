puts "Creating Presue un cri"

artist = Artist.new(
category: "concert",
name: "Presque un cri",
description: "Presque un cri est une plongé dans l'œuvre intense et puissante de l' auteur-compositeur-interprète
Vladimir Vyssotski. Les artistes Lise Martin et Valentin Vander nous proposent un spectacle dans
lequel ils interprètent des adaptations en français d’une partie des chansons de ce créateur hors du
commun.",
style: "Chanson" ,
image: "presque/presque-image" ,
banner: "presque/presque-banner" ,
dice1: "presque/presque-dice1" ,
dice2: "presque/presque-dice2" ,
dice3: "presque/presque-dice3" ,
dice4: "presque/presque-dice4",
video: "https://www.youtube.com/embed/mDlA_rctPoA",
youtube: "https://www.youtube.com/channel/UCUjTAIRy6R2kmNY2MhtZQ-Q",
distribution: ["Valentin Vander", "Lise Martin"],
partenaires: ["Forum Léo Ferret"],
user_id: 1
  )
artist.save!
 puts "Presque un cri done"
