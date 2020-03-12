class Like < ApplicationRecord
  belongs_to :game

  scope :recent, -> { where("created_at > ?", 5.minutes.ago)}
end
