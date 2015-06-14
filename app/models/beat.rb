class Beat < ActiveRecord::Base
  has_attached_file :track

  validates :title, presence: true
  validates :track, :attachment_presence => true
  validates_with AttachmentSizeValidator, attributes: :track, less_than: 6.megabytes
  validates_with AttachmentContentTypeValidator, attributes: :track, content_type: /audio\/.*/
end
