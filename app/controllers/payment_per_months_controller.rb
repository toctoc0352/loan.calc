class PaymentPerMonthsController < ApplicationController
  
  respond_to :html
  
  def new
    @paymentPerMonth = PaymentPerMonth.new
    respond_with @paymentPerMonth
  end
  
  def create
    @paymentPerMonth = PaymentPerMonth.new(permit_params)
    if @paymentPerMonth.valid?
    else
      render 'new'
    end
    #respond_with @paymentPerMonth, location: new_payment_per_month_url
  end
  
  private
    def permit_params
      params.require(:payment_per_month).permit(:loan, :bonus, :period, :apy)
    end
end
