class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)

    respond_to do |format|
      if @participant.save
        format.html { render 'invites/new', notice: 'Participant was successfully created.' }
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

    def participant_params
      params.require(:participant).permit(:phone, :event_id)
    end
end
