class TeamsController < ApplicationController
  def create
    @team = Team.new
  end

  def create_team
    team = Team.new(team_params)
    team.user = current_user
    team.save
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  def list
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
