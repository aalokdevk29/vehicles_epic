class Record < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  belongs_to :nationality
end
