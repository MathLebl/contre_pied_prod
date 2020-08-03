require 'faker'

puts 'Cleaning News...'
Actu.destroy_all

puts 'Creating Actus'
actu = Actu.new(
  title: "Première Actu",
  description: " Cagnotte gagnante
                sur Ulule pour Garance !
                Merci pour tout vos dons et
                votre soutien... Hâte de
                vous retrouver ! ",
  user_id: 1
  )
actu.featured_image.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
actu.save!


actu = Actu.new(
  title: "Deuxième Actu",
  description: " Bientôt 4 millions de vues pour La Goguettes T'as voulu voir le salon. Merci à vous tous pour vos
                partages. À très bientôt on espère....",
  video: "https://www.youtube.com/embed/BFOJtRFlY-8",
  user_id: 1
  )
actu.save!


puts 'Actus done'
