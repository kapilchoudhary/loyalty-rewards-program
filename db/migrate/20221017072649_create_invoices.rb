# frozen_string_literal: true

class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.decimal :total_amount
      t.references :user, null: false, foreign_key: true
      t.datetime :date_of_invoice
      t.boolean :foreign_investment

      t.timestamps
    end
  end
end
