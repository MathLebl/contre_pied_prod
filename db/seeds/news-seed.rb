require 'faker'

puts 'Creating Actus'

actu = Actu.new(
  description: " Cagnotte gagnante
                sur Ulule pour Garance !
                Merci pour tout vos dons et
                votre soutien... Hâte de
                vous retrouver ! ",
  illustration: "actu1",
  artist_id: 2,
  user_id: 1
  )
actu.save!

actu = Actu.new(
  description: " Bientôt 4 millions de vues pour La Goguettes T'as voulu voir le salon. Merci à vous tous pour vos
                partages. À très bientôt on espère....",
  video: "https://www.youtube.com/embed/BFOJtRFlY-8",
  artist_id: 13,
  user_id: 1
  )
actu.save!

puts 'Actus done'


# <iframe width="560" height="315" src="https://www.youtube.com/embed/BFOJtRFlY-8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
