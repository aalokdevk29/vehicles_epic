class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :model, null: false
      t.integer :year, null:false
      t.integer :chassis_number
      t.string :color
      t.date :registration_date, null: false
      t.integer :odometer_reading, null: false

      t.timestamps
    end
  end
end
