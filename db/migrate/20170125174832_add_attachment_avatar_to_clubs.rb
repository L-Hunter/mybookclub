class AddAttachmentAvatarToClubs < ActiveRecord::Migration
  def self.up
    change_table :clubs do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :clubs, :avatar
  end
end
