class RoomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @chat_room = true
    begin
      @team = Team.find_by(name: params[:team_name])
      @room = Room.find_by(name: params[:room_name])
      @rooms = @team.rooms
      @new_room = Room.new
      @messages = @room.messages.limit(50)
    rescue
      format.html { redirect_to not_founded_room_path }
    end
  end

  def create_room
    room = Room.create(room_params)
    redirect_to "http://#{request.host}:3000/#{room.team.name}/rooms/#{room.name}"
  end

  def room_params
    params.require(:room).permit(:name, :team_id)
  end
end
