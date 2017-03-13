class User < ApplicationRecord
  # include default devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # model relations
  has_many :messages

  # attribute validations
  validates :email, uniqueness: true

  def online
    redis.sadd("online", self.decorate.avatar_n_nickname)
    AppearanceBroadcastJob.perform_later list
  end

  def offline
    redis.srem("online", self.decorate.avatar_n_nickname)
    AppearanceBroadcastJob.perform_later list
  end

  def list
    redis.smembers("online")
  end

  private

  def redis
    Redis.new
  end
end
