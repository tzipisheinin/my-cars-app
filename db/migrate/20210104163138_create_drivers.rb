class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :email
      t.date :birth_date

      t.timestamps
    end
  end
end
