class Event < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :memories, :participants

  validates :name, :start_time, :end_time, :reminder_interval, :recap_alert_time, presence: true
  validates :name, uniqueness: { scope: :user_id }

  has_attached_file :image_file_name, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image_file_name, :content_type => /\Aimage\/.*\Z/
end
