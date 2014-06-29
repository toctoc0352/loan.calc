class PaymentPerMonthController < ApplicationController
  def index
  end
  
  def result
    @paymentPerMonth = PaymentPerMonth.new(permit_params)
  end
  
  private
    def permit_params
      params.permit(:loan, :bonus, :period, :apy)
    end
end
