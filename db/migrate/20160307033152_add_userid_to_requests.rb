class AddUseridToRequests < ActiveRecord::Migration
  def change
    add_column :rquests, :user_id, :integer
  end
end
