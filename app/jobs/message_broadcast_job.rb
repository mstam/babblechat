class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chatroom_channel", message: render_message(message), dialect_pick: message.dialect
  end

  private

  def render_message(message)
    ChatroomsController.render partial: 'messages/message', locals: {message: message}
  end
end
