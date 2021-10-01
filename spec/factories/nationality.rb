require 'faker'

FactoryBot.define do
  factory :nationality do
    name { Faker::Name.unique.name }
  end
end
