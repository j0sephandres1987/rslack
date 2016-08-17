class TeamsController < ApplicationController
  before_action :authenticate_user!
  def create
    @team = Team.new
  end

  def create_team
    team = Team.new(team_params)
    team.user = current_user
    current_user.teams << team
    Room.create_default_rooms(team)
    team.save
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
