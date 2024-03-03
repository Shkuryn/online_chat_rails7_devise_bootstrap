# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :set_room, only: %i[show edit update destroy]
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
  def edit; end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)

    if @room.save
      broadcast_room_creation
      redirect_to_room_with_notice
    else
      render_room_creation_error
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    @room = Room.find(params[:id])
    if update_room_name(room_params[:name])
      redirect_to @room, notice: 'Room was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room = Room.find(params[:id])
    if delete_room
      redirect_to rooms_url, notice: 'Room was successfully destroyed.'
    else
      redirect_to_room_with_alert
    end
  end


  def all_users
    @room = Room.find_by(name: 'All users')
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

  private

  def broadcast_room_creation
    @room.broadcast_append_to :rooms
  end

  def redirect_to_room_with_notice
    redirect_to room_url(@room), notice: 'Room was successfully created.'
  end

  def render_room_creation_error
    render :new, status: :unprocessable_entity
    render json: @room.errors, status: :unprocessable_entity
  end

  def update_room_name(new_name)
    RoomUpdater.new(@room).update_room_name(new_name)
  end

  def delete_room
    RoomRemover.new(@room).delete_room
  end

  def redirect_to_room_with_alert
    redirect_to @room, alert: "Cannot delete room with name #{@room.name}"
  end
end
