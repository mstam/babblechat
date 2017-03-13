class ChatroomsController < ApplicationController
  # chatroom main page
  def home
    @message = Message.new
    @messages = Message.all.limit(50)
  end
end
