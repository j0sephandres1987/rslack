class HomeController < ApplicationController
  before_action :authenticate_user!
  def welcome
    @own_teams = Team.where(user: current_user)
    @teams = current_user.teams
  end
end
