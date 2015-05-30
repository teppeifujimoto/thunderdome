class Beat < ActiveRecord::Base
  validates :title, presence: true
end
