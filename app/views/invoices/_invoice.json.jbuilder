json.extract! invoice, :id, :total_amount, :user_id, :date_of_invoice, :foreign_investment, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
