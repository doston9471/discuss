class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  # after_save_commit { broadcast_append_to room }
  after_create_commit { broadcast_append_later_to(self, locals: { user: current_user, message: self }) }
end
