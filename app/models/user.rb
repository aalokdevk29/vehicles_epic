class User < ApplicationRecord
  has_many :records
  has_many :vehicles, through: :records
end
