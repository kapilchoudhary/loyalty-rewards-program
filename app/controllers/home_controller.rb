# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @invoices = Invoice.all
  end
end
