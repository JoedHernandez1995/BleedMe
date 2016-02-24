class AddUsernameToPosts < ActiveRecord::Migration
  def change
    add_column :posts,:user_name,:string
    add_column :posts,:user_email,:string
  end
end
