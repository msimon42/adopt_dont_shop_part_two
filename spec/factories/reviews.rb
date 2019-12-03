FactoryBot.define do
  factory :random_review, class: Review do
    rating {rand(5)}
    image {Faker::LoremFlickr.image}
    title {Faker::Quote.singular_siegler}
    content {Faker::Quote.matz}
    created_at {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
  end
end
