class Room < ApplicationRecord
  belongs_to :user
  has_many :room_images
  belongs_to :reservation
end
