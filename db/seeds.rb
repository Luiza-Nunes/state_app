# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


states = ['Paraná', 'Santa Catarina', 'Rio Grande do Sul']
states.each do | state |
  State.find_or_create_by(name: state)
end

parana_cities = ['Curitiba', 'Foz do Iguaçu', 'Pontal do Paraná', 'São José dos Pinhais']
parana_cities.each do | city |
  City.find_or_create_by(name: city, state: State.find_by(name: 'Paraná'))
end

santa_catarina_cities = ['Balneário Camboriú', 'Blumenau', 'Florianópolis', 'Joinville']
santa_catarina_cities.each do | city |
  City.find_or_create_by(name: city, state: State.find_by(name: 'Santa Catarina'))
end

rio_grande_do_sul_cities = ['Erebango', 'Erechim', 'Gramado', 'Porto Alegre']
rio_grande_do_sul_cities.each do | city |
  City.find_or_create_by(name: city, state: State.find_by(name: 'Rio Grande do Sul'))
end