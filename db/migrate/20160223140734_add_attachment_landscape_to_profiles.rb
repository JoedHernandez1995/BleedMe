class AddAttachmentLandscapeToProfiles < ActiveRecord::Migration
  def self.up
    change_table :profiles do |t|
      t.attachment :landscape
    end
  end

  def self.down
    remove_attachment :profiles, :landscape
  end
end
