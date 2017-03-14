class ChatroomsController < ApplicationController
  # chatroom main page
  def home
    session[:dialect] = params[:dialect][:pick] if request.post?
    @message = Message.new
    @messages = Message.all.limit(50)
  end
end
