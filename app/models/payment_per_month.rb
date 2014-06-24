class PaymentPerMonth
  include ActiveModel::Model
  
  attr_accessor :loan, :bonus, :period, :apy
  
  validates :loan, presence: true, numericality: true
  validates :bonus, presence: true, numericality: true
  validates :period, presence: true, numericality: true
  validates :apy, presence: true, numericality: true
  
  def amount
    if !self.valid?
      return nil
    end
    apy = self.apy / 100.to_f
    ratePerMonth = apy / 12.to_f
    repaymentCount = self.period * 12.to_f
    repaymentAmount = ( (self.loan - self.bonus) * ratePerMonth ) / ( 1 - ( 1 + ratePerMonth ) ** (repaymentCount * -1) ).to_f
    repaymentAmount.round
  end
  
end