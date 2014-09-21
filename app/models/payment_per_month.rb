class PaymentPerMonth
  include ActiveModel::Model
  
  attr_accessor :loan, :bonus, :period, :apy
  
  validates :loan, numericality: true
  validates :bonus, numericality: true
  validates :period, numericality: true
  validates :apy, numericality: true
  
  def amount
    if !self.valid?
      return nil
    end
    loan = self.loan.to_f
    bonus = self.bonus.to_f
    period = self.period.to_f
    apy = self.apy.to_f / 100
    ratePerMonth = apy / 12
    repaymentCount = period * 12
    repaymentAmount = ( (loan - bonus) * ratePerMonth ) / ( 1 - ( 1 + ratePerMonth ) ** (repaymentCount * -1) ).to_f
    repaymentAmount.round
  end
  
end