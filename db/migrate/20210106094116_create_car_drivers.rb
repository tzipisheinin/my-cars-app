class CreateCarDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :car_drivers do |t|
      t.integer :car_id
      t.integer :driver_id
      
      t.timestamps
    end
  end
end
