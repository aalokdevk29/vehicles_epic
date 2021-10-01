require 'csv'

class Record < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  belongs_to :nationality

  scope :data, -> { includes(:user, :vehicle, :nationality) }

  def self.search(search)
    if search
      Record.data.where('users.name LIKE ? OR vehicles.model LIKE ?', "%#{search}%", "%#{search}%").references(:users, :vehicles)
    else
      Record.data
    end
  end

  def self.customer_count_by_nationality
    results =  Record.data.group('nationalities.name').count('records.id')
    attributes = ['Nationality', 'Cusotmer Count']

    CSV.generate do |csv|
      csv << attributes

      results.each do |result|
        csv << result
      end
    end
  end

  def self.average_odometer_reading_by_nationality
    results =  Record.data.group('nationalities.name').average('vehicles.odometer_reading')
    attributes = ['Nationality', 'Average Odometer Reading']

    CSV.generate do |csv|
      csv << attributes

      results.each do |result|
        csv << result
      end
    end
  end
end
