require 'csv'

class ImportData
  def initialize(file)
    @file = file
  end

  def import
    CSV.foreach(@file.path, headers: true) do |row|
      record_hash = row.to_hash
      nationality = create_nationality(record_hash)
      vehicle = create_vehicle(record_hash)
      user = create_user(record_hash)
      if vehicle && user
        Record.create(user_id: user.id, vehicle_id: vehicle.id, nationality_id: nationality.id)
      end
    end
  end

  private

  def create_nationality(record_hash)
    Nationality.find_or_create_by(name: record_hash['Nationality'])
  end

  def create_vehicle(record_hash)
    Vehicle.create(
                    model: record_hash['Model'],
                    year: record_hash['Year'],
                    chassis_number: record_hash['ChassisNumber'],
                    color: record_hash['Color'],
                    registration_date: record_hash['RegistrationDate'],
                    odometer_reading: record_hash['OdometerReading']
                  )
  end

  def create_user(record_hash)
    User.create(
                  name: record_hash['Name'],
                  email: record_hash['Email']
                )
  end
end
