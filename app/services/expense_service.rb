# app/services/expense_service.rb
class ExpenseService
  API_URL = 'https://my.api.mockaroo.com/invoices.json'.freeze
  API_KEY = 'b490bb80'.freeze
  def initialize(expense_params)
    @expense_params = expense_params
  end

  def create
    expense = Expense.new(@expense_params)

    if expense.save
      { success: true, expense: expense }
    else
      { success: false, errors: expense.errors.full_messages }
    end
  end

  def create_invoice_with_third_party_api(invoice_number)
    puts "Correct: #{invoice_number}"
    uri = URI(API_URL)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path)
    request['X-API-Key'] = API_KEY
    request.body = { invoice_id: invoice_number.to_i }.to_json
    puts "request: #{JSON.parse(request.body)}"
    response = http.request(request)
    puts "response: #{JSON.parse(response.body)}"
    if response.code.to_i == 200
      { success: true, response: JSON.parse(response.body) }
    else
      { success: false, error: "API request failed: #{response.message}" }
    end
  end
end
