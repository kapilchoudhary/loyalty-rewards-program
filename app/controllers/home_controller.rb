class HomeController < ApplicationController
  def index
    @invoices = Invoice.all
  end
end
