require 'test_helper'

class InvitationsControllerTest < ActionDispatch::IntegrationTest
  test "should get send_invitation_email" do
    get invitations_send_invitation_email_url
    assert_response :success
  end

end
