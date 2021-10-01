class Record < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  belongs_to :nationality

  scope :data, -> { includes(:user, :vehicle, :nationality) }
  scope :data_joins, -> { joins(:user, :vehicle, :nationality) }

  def self.search(search)
    if search
      Record.data_joins.where('users.name LIKE ? OR vehicles.model LIKE ?', "%#{search}%", "%#{search}%")
    else
      Record.data
    end
  end
end
