class Beat < ActiveRecord::Base
  validates :title, presence: true
  has_attached_file :track
  validates_attachment_content_type :track, :content_type => /.*/

end
