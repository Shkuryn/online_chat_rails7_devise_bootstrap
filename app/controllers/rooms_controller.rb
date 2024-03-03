class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    @messages = @room.messages
    @message = current_user&.messages&.build(room: @room)
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        @room.broadcast_append_to :rooms
        format.html { redirect_to room_url(@room), notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    @room = Room.find(params[:id])
    room_service = RoomUpdater.new(@room)
    if room_service.update_room_name(room_params[:name])
      redirect_to @room, notice: 'Room was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room = Room.find(params[:id])
    room_remover = RoomRemover.new(@room)
    if room_remover.delete_room
      redirect_to rooms_url, notice: 'Room was successfully destroyed.'
    else
      redirect_to @room, alert: "Cannot delete room with name #{@room.name}"
    end
  end

  def all_users
    @room = Room.find_by(name: "All users")
    @messages = @room.messages
    @message = current_user&.messages&.build(room: @room)
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name)
    end
end
