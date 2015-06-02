class Participant < ActiveRecord::Base
  belongs_to :event

  before_save :format_phone

  private

  def format_phone
    self.phone  = "+1" + self.phone
  end

end
