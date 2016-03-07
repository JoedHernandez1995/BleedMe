class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :needed_for
      t.string :blood_type_needed
      t.decimal :blood_units_needed
      t.date :date_needed
      t.text :compatible_blood_types
      t.text :message

      t.timestamps null: false
    end
  end
end
