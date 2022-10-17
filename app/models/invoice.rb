# frozen_string_literal: true

class Invoice < ApplicationRecord
  belongs_to :user

  validates :date_of_invoice, :total_amount, presence: true

  scope :foreign_investments, -> { where(foreign_investment: true) }
  scope :local_investments, -> { where(foreign_investment: false) }

  after_create :reward_loyalty_point
  after_create :check_cash_rebate_reward_awarded

  private

  def reward_loyalty_point
    return if total_amount < 100

    points = (total_amount / 100) * 10 # Standard points
    points *= 2 if foreign_investment  # Receive 2x the standard points for spend in foreign

    user.loyalty_points.create(point: points)
  end

  def check_cash_rebate_reward_awarded
    transcations_count = user.invoices.where('total_amount > ?', 100).count

    return if (transcations_count < 10) || Flag.flagged?(user, 'cash_rebate_awarded')

    user.reward_user('cash_rebate')
    Flag.flag(user, 'cash_rebate_awarded')
  end
end
