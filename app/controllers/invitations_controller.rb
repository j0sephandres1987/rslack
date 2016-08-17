class InvitationsController < ApplicationController
  def send_invitation_email
    begin
      invitation = Invitation.new(invitation_params)
      InvitationMailer.invitation_email(invitation_params[:email], invitation_params[:team_id]).deliver
      flash[:notice] = "invitation was sent successfully to: #{invitation_params[:email]}"
      invitation.user = current_user
      invitation.save
    rescue Exception => e
      flash[:alert] = e.message
    end
    redirect_to home_welcome_path
  end

  def accept
    invitation = Invitation.find_by(token: params[:token])
    current_user.teams << invitation.team
    invitation.update status: true
    redirect_to home_welcome_path
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email, :team_id)
  end
end
