# frozen_string_literal: true

class LoyaltyPoint < ApplicationRecord
  belongs_to :user

  validates :point, presence: true

  scope :user_points, ->(user) { where(user_id: user.id) }
end
