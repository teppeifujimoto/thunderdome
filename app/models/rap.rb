class Rap < ActiveRecord::Base
  MAX_TRACK_SIZE = 10.megabytes

  belongs_to :beat
  has_attached_file :track

  validates :title, presence: true

  validates :track, :attachment_presence => true
  validates_with AttachmentSizeValidator, attributes: :track, less_than: MAX_TRACK_SIZE
  validates_with AttachmentContentTypeValidator, attributes: :track, content_type: /audio\/.*/
end
