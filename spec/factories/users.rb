# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email    { 'test_user@loyalty.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
