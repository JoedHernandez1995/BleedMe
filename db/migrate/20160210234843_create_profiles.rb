class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|

      t.string  :name
      t.string  :last_name
      t.date    :birth_date
      t.text    :biography
      t.string  :country
      t.string  :city
      t.string  :phone_number
      t.string  :cell_phone
      t.string  :blood_type

      t.timestamps null: false
    end
  end
end
