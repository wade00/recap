class InvitesController < ApplicationController
  before_action :set_memory, only: [:destroy]
  before_action :set_event

  def new
    @invite = Memory.new
  end

  def create
    @invite = Memory.new(memory_params)

    respond_to do |format|
      if @invite.save
        format.html { render "static_pages/successful_submit", notice: 'Invite was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @invite.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Invite was successfully destroyed.' }
    end
  end

  private
    def set_invite
      @invite = Invite.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def invite_params
      params.require(:invites).permit(:participant_id, :event_id)
    end
end
