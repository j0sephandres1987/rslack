class RoomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @chat_room = true
    begin
      @team = Team.find_by(name: params[:team_name])
      @room = Room.where(["name = ? and team_id = ?", params[:room_name], @team.id]).first
      @rooms = @team.rooms
      @messages = @room.messages.limit(50)
    rescue
      redirect_to root_path
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
