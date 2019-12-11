FactoryBot.define do
  factory :random_review, class: Review do
    rating {rand(5)}
    image {Faker::LoremFlickr.image(search_terms: [Faker::Hipster.words])}
    title {Faker::Quote.singular_siegler}
    content {Faker::Quote.matz}
    created_at {Faker::Time.between(from: DateTime.now - 365, to: DateTime.now)}
  end

  factory :random_review_test, class: Review do
    rating {rand(5)}
    title {Faker::String.random}
    content {Faker::String.random}
    created_at {Faker::Time.between(from: DateTime.now - 365, to: DateTime.now)}
  end
end
