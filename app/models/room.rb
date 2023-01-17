class Room < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages
  after_create_commit { broadcast_append_to 'rooms' }
end
