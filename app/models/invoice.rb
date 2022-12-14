# frozen_string_literal: true

# app/models/invoice.rb
class Invoice < ApplicationRecord
  belongs_to :user

  validates :date_of_invoice, :total_amount, presence: true

  default_scope -> { order('created_at asc') }

  scope :foreign_investments, -> { where(foreign_investment: true) }
  scope :local_investments, -> { where(foreign_investment: false) }

  after_create :reward_loyalty_point, if: -> { !Flag.flagged?(user, 'cash_rebate_awarded') }
  after_create :award_cash_rebate_reward, if: -> { !Flag.flagged?(user, 'movie_ticket_awarded') }

  private

  def reward_loyalty_point
    return if total_amount < 100

    points = (total_amount / 100) * 10
    points *= 2 if foreign_investment

    user.loyalty_points.create(point: points)
  end

  def award_cash_rebate_reward
    transcations_count = user.invoices.where('total_amount > ?', 100).count

    return if transcations_count < 10

    user.reward_user('cash_rebate')
    Flag.flag(user, 'cash_rebate_awarded')
  end

  def award_movie_ticket_reward
    first_transaction_date = user.invoices.first.created_at

    transcation_within_60_days = Invoice.where(created_at: first_transaction_date..(first_transaction_date + 60.day))
                                        .sum(:total_amount)

    return if transcation_within_60_days < 1000

    user.reward_user('movie_ticket_awarded')
    Flag.flag(user, 'movie_ticket_awarded')
  end
end
