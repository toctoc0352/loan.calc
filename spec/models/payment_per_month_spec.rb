require 'spec_helper'

describe PaymentPerMonth do
  before do
     @PaymentPerMonth = PaymentPerMonth.new(loan: 1000000, bonus: 200000,
                            period: 10, apy: 1.0)
  end
  
  subject { @PaymentPerMonth }
  
  describe "when loan is not present" do
    before { @PaymentPerMonth.loan = "" }
    it { should_not be_valid }
  end
  
  describe "when loan is not number" do
    before { @PaymentPerMonth.loan = "hoge" }
    it { should_not be_valid }
  end

  describe "when bonus is not present" do
    before { @PaymentPerMonth.bonus = "" }
    it { should_not be_valid }
  end
  
  describe "when bonus is not number" do
    before { @PaymentPerMonth.bonus = "hoge" }
    it { should_not be_valid }
  end
  
  describe "when period is not present" do
    before { @PaymentPerMonth.period = "" }
    it { should_not be_valid }
  end
  
  describe "when period is not number" do
    before { @PaymentPerMonth.period = "hoge" }
    it { should_not be_valid }
  end

  describe "when apy is not present" do
    before { @PaymentPerMonth.apy = "" }
    it { should_not be_valid }
  end
  
  describe "when apy is not number" do
    before { @PaymentPerMonth.apy = "hoge" }
    it { should_not be_valid }
  end
  
end
