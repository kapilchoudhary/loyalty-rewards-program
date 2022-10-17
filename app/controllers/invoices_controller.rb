# frozen_string_literal: true

class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[show edit update destroy]

  def show; end

  def new
    @invoice = Invoice.new
  end

  def edit; end

  def create
    @invoice = current_user.invoices.build(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to invoice_url(@invoice), notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to invoice_url(@invoice), notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice)
          .permit(:total_amount, :user_id,
                  :date_of_invoice, :foreign_investment)
  end
end
