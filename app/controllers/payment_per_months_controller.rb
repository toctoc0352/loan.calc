class PaymentPerMonthsController < ApplicationController
  
  respond_to :html, :js
  
  def new
    @paymentPerMonth = PaymentPerMonth.new
    respond_with @paymentPerMonth
  end
  
  def create
    @paymentPerMonth = PaymentPerMonth.new(permit_params)
    respond_with @paymentPerMonth
  end
  
  private
    def permit_params
      params.require(:payment_per_month).permit(:loan, :bonus, :period, :apy)
    end
end
