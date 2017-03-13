class ChatroomsController < ApplicationController
  # chatroom main page
  def home
    @message = Message.new
  end
end
