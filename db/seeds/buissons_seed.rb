puts "Creating Les Buissons"

artist = Artist.new(
category: "concert",
name: "Les Buissons",
description: "Les Buissons, c'est trois auteurs, compositeurs et interprètes qui mélangent leurs influences et créent
ensemble un répertoire nouveau. Munis de guitares, d'un accordéon, d'un cajon, et de trois voix
enjouées, ils ne se prennent pas complètement au sérieux et colorent leurs créations d'un humour
qui confine parfois à l'absurde. ",
style: "Chanson / humour" ,
image: "buissons/buissons-image" ,
banner: "buissons/buissons-banner" ,
dice1: "buissons/buissons-dice1" ,
dice2: "buissons/buissons-dice2" ,
dice3: "buissons/buissons-dice3" ,
dice4: "buissons/buissons-dice4",
video: "https://www.youtube.com/embed/BFOJtRFlY-8",
distribution: ["Mathieu Gabard", "Yéshé Henneguelle", "Valentin Vander"],
partenaires: ["Le café du village", "La maison du village"],
user_id: 1
  )
artist.save!
 puts "Buissons done"
