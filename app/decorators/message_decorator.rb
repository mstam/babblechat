class MessageDecorator < Draper::Decorator
  delegate_all
  #return message timestamp
  def timestamp
    object.created_at.strftime('%d.%m.%y@%H:%M:%S')
  end
end
