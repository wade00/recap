class Memory < ActiveRecord::Base
  belongs_to :event

  validates :image_file_name, presence: true

  has_attached_file :image_file_name, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image_file_name, :content_type => /\Aimage\/.*\Z/
end
