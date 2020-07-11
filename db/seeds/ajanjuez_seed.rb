puts "Creating Les beaux jours d'Aranjuez"

artist = Artist.new(
category: "spectacle",
name: "Les beaux jours d'Aranjuez",
description: "Une femme et un homme se retrouvent. Un lieu abstrait, par exemple une salle de théâtre. Un jeu de
questions/réponses se met alors en place. Nous en ignorons la règle tacite. Comme si pour mieux se
raconter, il fallait taire certaines choses. Mais est-ce encore possible ? De se raconter ? De se taire ?
À la frontière entre réalité et fiction, on se parle d'amour et de nature, comme si Platon et son
Banquet n'étaient pas si loin.",
style: "Théâtre" ,
video: "https://www.youtube.com/embed/h-oNNO3Oi4M",
distribution: ["Flore Babled", "Vincent Pouderoux"],
credits: ["Mise en scène : Yéshé Henneguelle", "Texte : Peter Handke" , "Dramaturgie : Estelle Baudou", "Costumes : Pétronille Salomé", "Lumière : Vincent Lemaitre", "Scénographie : Salma Bordes", "Assistanat : Benoit Tipy"],
user_id: 1
  )
artist.image.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
artist.banner_image.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
artist.show_image1.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
artist.show_image2.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
artist.show_image3.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
artist.show_image4.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
artist.save!
 puts "Goguette done"
