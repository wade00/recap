class Participant < ActiveRecord::Base
  belongs_to :event

  validates :phone, presence: true

  before_save :format_phone

  private

  def format_machine_categories
    self.phone  = "+1" + self.phone
  end
end
