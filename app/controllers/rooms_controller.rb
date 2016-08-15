class RoomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @chat_room = true
    @messages = Message.all
  end
end
