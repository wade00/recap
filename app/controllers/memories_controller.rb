class MemoriesController < ApplicationController
  before_action :set_memory, only: [:show, :edit, :update, :destroy]

  def index
    @memories = Memory.all
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
        format.html { redirect_to @memory, notice: 'Memory was successfully created.' }
        format.json { render :show, status: :created, location: @memory }
      else
        format.html { render :new }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @memory.update(memory_params)
        format.html { redirect_to @memory, notice: 'Memory was successfully updated.' }
        format.json { render :show, status: :ok, location: @memory }
      else
        format.html { render :edit }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @memory.destroy
    respond_to do |format|
      format.html { redirect_to memories_url, notice: 'Memory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_memory
      @memory = Memory.find(params[:id])
    end

    def memory_params
      params.require(:memory).permit(:image_file_name,, :description, :event_id)
    end
end
