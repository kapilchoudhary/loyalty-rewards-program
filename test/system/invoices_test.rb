# frozen_string_literal: true

require 'application_system_test_case'

class InvoicesTest < ApplicationSystemTestCase
  setup do
    @invoice = invoices(:one)
  end

  test 'visiting the index' do
    visit invoices_url
    assert_selector 'h1', text: 'Invoices'
  end

  test 'should create invoice' do
    visit invoices_url
    click_on 'New invoice'

    fill_in 'Date of invoice', with: @invoice.date_of_invoice
    check 'Foreign investment' if @invoice.foreign_investment
    fill_in 'Total amount', with: @invoice.total_amount
    fill_in 'User', with: @invoice.user_id
    click_on 'Create Invoice'

    assert_text 'Invoice was successfully created'
    click_on 'Back'
  end

  test 'should update Invoice' do
    visit invoice_url(@invoice)
    click_on 'Edit this invoice', match: :first

    fill_in 'Date of invoice', with: @invoice.date_of_invoice
    check 'Foreign investment' if @invoice.foreign_investment
    fill_in 'Total amount', with: @invoice.total_amount
    fill_in 'User', with: @invoice.user_id
    click_on 'Update Invoice'

    assert_text 'Invoice was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Invoice' do
    visit invoice_url(@invoice)
    click_on 'Destroy this invoice', match: :first

    assert_text 'Invoice was successfully destroyed'
  end
end
