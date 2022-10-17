require "rails_helper"

RSpec.describe Invoice, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:invoices) { FactoryBot.create_list(:invoice, 10, user_id: user.id) }

  it { should belong_to(:user) }

  it { should validate_presence_of(:date_of_invoice) }

  it "creates loyalty points to user" do
    user_loyalty_points = LoyaltyPoint.user_points(invoices.first.user)

    expect(user_loyalty_points).to equal(100)
  end
end
