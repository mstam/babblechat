class Message < ApplicationRecord
  # run job after message commit
  after_create_commit { MessageBroadcastJob.perform_later(self) }
  # model relations
  belongs_to :user
end
