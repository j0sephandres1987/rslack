class HomeController < ApplicationController
  before_action :authenticate_user!
  def welcome
    @own = Team.where(user: current_user)
    @teams = current_user.teams
    @invitations = Invitation.where(["email = ? and status = ?", current_user.email, false])
  end
end
