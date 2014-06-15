class PaymentPerMonth
  include ActiveModel::Model
  
  attr_accessor :loan, :bonus, :period, :apy
  
  validates :loan, presence: true, numericality: true
  validates :bonus, presence: true, numericality: true
  validates :period, presence: true, numericality: true
  validates :apy, presence: true, numericality: true
end