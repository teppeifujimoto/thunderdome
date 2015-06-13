class AddAttachmentTrackToBeats < ActiveRecord::Migration
  def self.up
    change_table :beats do |t|
      t.attachment :track
    end
  end

  def self.down
    remove_attachment :beats, :track
  end
end
