require 'faker'

puts 'Creating Actus'
2.times do
actu = Actu.new(
  title: "Première Actu",
  description: " Cagnotte gagnante
                sur Ulule pour Garance !
                Merci pour tout vos dons et
                votre soutien... Hâte de
                vous retrouver ! ",
  artist_id: 4,
  user_id: 1
  )
actu.save!
end

2.times do
actu = Actu.new(
  title: "Deuxième Actu",
  description: " Bientôt 4 millions de vues pour La Goguettes T'as voulu voir le salon. Merci à vous tous pour vos
                partages. À très bientôt on espère....",
  video: "https://www.youtube.com/embed/BFOJtRFlY-8",
  artist_id: 11,
  user_id: 1
  )
actu.save!
end


puts 'Actus done'


# <iframe width="560" height="315" src="https://www.youtube.com/embed/BFOJtRFlY-8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
