class AddTrackToRap < ActiveRecord::Migration
  def change
    add_attachment :raps, :track
  end
end
