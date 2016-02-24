class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.timestamps null: false
      t.text        :body
    end
  end
end
