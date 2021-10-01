class Vehicle < ApplicationRecord
  has_one :record
  has_one :user, through: :records
end
