# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.destroy_all
Shelter.destroy_all
Pet.destroy_all


shelters = [shelter_1 = Shelter.create(
  name: 'Shelter of Dog',
  address: '123 main street',
  city: 'Denver',
  state: 'CO',
  zip: '80234'
),

shelter_2 = Shelter.create(
  name: 'Animal Center',
  address: '123 Way St',
  city: 'Denver',
  state: 'CO',
  zip: '80444'
),

shelter_3 = Shelter.create(
  name: 'DogLand',
  address: '123 Broadway',
  city: 'Denver',
  state: 'CO',
  zip: '80848'
),

shelter_4 = Shelter.create(
  name: 'Center of Pets',
  address: '123 Colfax',
  city: 'Denver',
  state: 'CO',
  zip: '80218'
),

shelter_5 = Shelter.create(
  name: 'Animal Shelter',
  address: '123 Denver Street',
  city: 'Denver',
  state: 'CO',
  zip: '80244'
)]

shelters.each do |shelter|
  FactoryBot.create_list(:random_pet, 15, shelter: shelter)
  FactoryBot.create_list(:random_review, 10, shelter: shelter)
end
