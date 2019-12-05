FactoryBot.define do
  factory :application do
    pet { nil }
    name { "MyString" }
    address { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip { "MyString" }
    phone_number { "MyString" }
    description { "MyText" }
  end
end
