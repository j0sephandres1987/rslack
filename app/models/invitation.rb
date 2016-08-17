class Invitation < ApplicationRecord
  before_create :generate_token, unless: :token?

  belongs_to :team
  belongs_to :user

  private
  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end
end
