class Invite < ActiveRecord::Base
  belongs_to :event
  belongs_to :invitee, class_name: "Participant", foreign_key: "participant_id"
end
