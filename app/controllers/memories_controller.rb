class MemoriesController < ApplicationController
  before_action :set_memory, only: [:show, :edit, :update, :destroy]
  before_action :set_event

  def index
    @memories = @event.memories.all
  end

  def show
  end

  def new
    @memory = Memory.new
  end

  def edit
  end

  def create
    @memory = Memory.new(memory_params)

    respond_to do |format|
      if @memory.save
        format.html { render "static_pages/memory_submit", notice: 'Memory was successfully created.' }
        format.json { render :show, status: :created, location: @event.memory }
      else
        format.html { render :new }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @memory.update(memory_params)
        format.html { redirect_to event_memories_path, notice: 'Memory was successfully updated.' }
        format.json { render :show, status: :ok, location: @event.memory }
      else
        format.html { render :edit }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @memory.destroy
    respond_to do |format|
      format.html { redirect_to event_memories_path, notice: 'Memory was successfully destroyed.' }
      format.json { head :no_content }
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
