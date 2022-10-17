# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :loyalty_points, dependent: :destroy
  has_many :invoices, dependent: :destroy

  has_many :user_rewards, dependent: :destroy
  has_many :loyalty_rewards, through: :user_rewards

  def reward_user(reward_type)
    users_rewards.create(loyalty_reward: LoyaltyReward.send(reward_type))
  end
end
