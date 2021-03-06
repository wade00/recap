class Memory < ActiveRecord::Base
  belongs_to :event

  validates :image, presence: true

  has_attached_file :image, styles: { recap: "900x900>", medium: "300x300>", thumb: "100x100>" },
                            default_url: "/images/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
