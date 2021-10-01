class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.belongs_to :user
      t.belongs_to :vehicle
      t.belongs_to :nationality

      t.timestamps
    end
  end
end
