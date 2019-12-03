FactoryBot.define do
  factory :random_pet, class: Pet do
    name {Faker::Creature::Dog.name}
    description {Faker::Creature::Dog.meme_phrase}
    image {Faker::LoremFlickr.image(search_terms: ['Dog'])}
    approx_age {rand(10).to_i}
    sex {Faker::Creature::Dog.gender}
    adoptable? {true}
  end
end
