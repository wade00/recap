class Participant < ActiveRecord::Base
  belongs_to :event

  validates :phone, presence: true
end
