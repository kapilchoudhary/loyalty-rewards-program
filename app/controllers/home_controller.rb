# frozen_string_literal: true

# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    @invoices = Invoice.all
    @rewards = current_user.loyalty_rewards
  end
end
