class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  # validates :gym_id, presence: true
  # validates :client_id, presence: true
  validates :charge, numericality: { greater_than_or_equal_to: 0 }
  validates :gym_id, uniqueness: { scope: :client_id }
end
