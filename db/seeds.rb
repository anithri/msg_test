# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

heros = [
    {code_name: 'The Batman', real_name: 'Bruce Wayne'},
    {code_name: 'The Flash', real_name: 'Barry Allen'},
    {code_name: 'Superman', real_name: 'Kal-el'}
]

heros.each do |hero_data|
  Hero.find_or_create_by(hero_data)
end
