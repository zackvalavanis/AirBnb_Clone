class Room < ApplicationRecord
  belongs_to :user
  has_many :room_images
end
