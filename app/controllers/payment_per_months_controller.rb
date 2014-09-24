class PaymentPerMonthsController < ApplicationController
  
  respond_to :html

  def index
    @paymentPerMonth = PaymentPerMonth.new
    render 'new'
  end

  def new
    @paymentPerMonth = PaymentPerMonth.new
    respond_with @paymentPerMonth
  end
  
  def create
    @paymentPerMonth = PaymentPerMonth.new(permit_params)
    @paymentPerMonth.valid?
    render 'new'
  end
  
  private
    def permit_params
      params.require(:payment_per_month).permit(:loan, :bonus, :period, :apy)
    end

end
