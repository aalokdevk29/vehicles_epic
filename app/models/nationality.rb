class Nationality < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :records
  has_many :users, through: :records
  has_many :vehicles, through: :records
end
