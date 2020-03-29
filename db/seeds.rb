require 'faker'

puts 'Creating all the Seeds'

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
  load seed
end

puts 'Finished!'
