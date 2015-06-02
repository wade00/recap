class MemoriesController < ApplicationController
  before_action :set_memory, only: [:destroy]
  before_action :set_event

  def index
    @memories = @event.memories.all
  end

  def new
    @memory = Memory.new
  end

  def create
    @memory = Memory.new(memory_params)

    respond_to do |format|
      if @memory.save
        format.html { redirect_to thanks_path, notice: 'Memory stored. Boom.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_memory
      @memory = Memory.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def memory_params
      params.require(:memories).permit(:image, :description, :event_id)
    end
end
