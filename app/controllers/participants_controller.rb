class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]
  before_action :set_event

  def index
    @participants = @event.participants
  end

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)

    respond_to do |format|
      if @participant.save
        format.html { redirect_to new_event_participant_path,
                      notice: 'Participant added.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @participant.destroy
    respond_to do |format|
      format.html { redirect_to event_participants_url, notice: 'Participant was successfully destroyed.' }
    end
  end

  private
    def set_participant
      @participant = Participant.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def participant_params
      params.require(:participant).permit(:phone, :event_id)
    end
end
