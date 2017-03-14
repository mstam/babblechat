class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatroom_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    translation_request = HTTParty.get("http://www.degraeve.com/cgi-bin/babel.cgi?d=#{data['dialect_pick']}&url=&w=#{data['message']}")
    translated_message = Nokogiri::HTML(translation_request).css('blockquote').text.gsub("/n", "")
    current_user.messages.create!(content: translated_message, dialect: data['dialect_pick'])
  end
end
