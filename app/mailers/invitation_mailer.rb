class InvitationMailer < ApplicationMailer
  default from: "rslackmailer@gmail.com"

  def invitation_email(email, team)
    @team_name = Team.find(team).name
    @general_room = "http://localhost:3000/#{@team_name}/rooms/general"
    mail(to: email, subject: "Rslack - #{@team_name} invitation")
  end
end
