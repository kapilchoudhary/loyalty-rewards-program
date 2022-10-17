# frozen_string_literal: true

LoyaltyReward::REWARD_TYPE.each do |type|
  LoyaltyReward.create(reward_type: type)
end
