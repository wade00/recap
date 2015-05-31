class Memory < ActiveRecord::Base
  belongs_to :event

  validates :image_file_name, presence: true
end
