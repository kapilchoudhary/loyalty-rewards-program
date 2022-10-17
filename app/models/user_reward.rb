# frozen_string_literal: true

class UserReward < ApplicationRecord
  belongs_to :user
  belongs_to :loyalty_rewards
end
