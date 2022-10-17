# frozen_string_literal: true

class Flag < ApplicationRecord
  LABELS = %w[
    cash_rebate_awarded
  ].freeze

  belongs_to :user

  validates :label, inclusion: { in: LABELS }

  def self.flag(user, label)
    return if Flag.flagged?(user, label)

    Flag.create(user_id: user.id, label: label.to_s)
  end

  def self.flagged?(user, label)
    Flag.where(user_id: user.id, label: label.to_s).exists?
  end
end
