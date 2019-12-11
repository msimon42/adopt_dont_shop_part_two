FactoryBot.define do
  factory :random_application, class: Application do
    name {Faker::Name.name}
    address {Faker::Address.street_address}
    city {Faker::Address.city}
    state {Faker::Address.state_abbr}
    zip {Faker::Address.zip}
    phone_number {Faker::PhoneNumber.cell_phone}
    description {Faker::Quote.matz}
    created_at {Faker::Time.between(from: DateTime.now - 50, to: DateTime.now)}
  end
end
