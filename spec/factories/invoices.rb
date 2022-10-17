FactoryBot.define do
  factory :invoice do
    total_amount { 100 }
    date_of_invoice { Date.today }
    foreign_investment { false }
    association :user
  end
end
