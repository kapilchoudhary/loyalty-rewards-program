# frozen_string_literal: true

# app/models/user_reward.rb
class UserReward < ApplicationRecord
  belongs_to :user
  belongs_to :loyalty_reward
end
