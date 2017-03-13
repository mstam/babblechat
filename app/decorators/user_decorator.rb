class UserDecorator < Draper::Decorator
  delegate_all
  #return nickname
  def nickname
    object.email.split('@')[0].capitalize
  end

  def avatar_n_nickname
    "<img src='/assets/noavatar.png'/> #{object.email.split('@')[0].capitalize}"
  end
end
