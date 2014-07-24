require 'spec_helper'

describe PaymentPerMonth do
  before do
     @paymentPerMonth = PaymentPerMonth.new(loan: 1000000, bonus: 200000,
                            period: 10, apy: 1.0)
  end
  
  subject { @paymentPerMonth }
  
  describe "when loan is not present" do
    before { @paymentPerMonth.loan = "" }
    it { should_not be_valid }
  end
  
  describe "when loan is not number" do
    before { @paymentPerMonth.loan = "hoge" }
    it { should_not be_valid }
  end

  describe "when bonus is not present" do
    before { @paymentPerMonth.bonus = "" }
    it { should_not be_valid }
  end
  
  describe "when bonus is not number" do
    before { @paymentPerMonth.bonus = "hoge" }
    it { should_not be_valid }
  end
  
  describe "when period is not present" do
    before { @paymentPerMonth.period = "" }
    it { should_not be_valid }
  end
  
  describe "when period is not number" do
    before { @paymentPerMonth.period = "hoge" }
    it { should_not be_valid }
  end

  describe "when apy is not present" do
    before { @paymentPerMonth.apy = "" }
    it { should_not be_valid }
  end
  
  describe "when apy is not number" do
    before { @paymentPerMonth.apy = "hoge" }
    it { should_not be_valid }
  end
  
  describe "valid amount" do
    
    describe "return 126481" do
      before do
        @paymentPerMonth.loan = 30000000
        @paymentPerMonth.bonus = 0
        @paymentPerMonth.period = 30
        @paymentPerMonth.apy = 3
      end
      its(:amount){ should == 126481 }
    end


    describe "return 80410" do
      before do
        @paymentPerMonth.loan = 30000000
        @paymentPerMonth.bonus = 5000000
        @paymentPerMonth.period = 30
        @paymentPerMonth.apy = 1
      end
      its(:amount){ should == 80410 }
    end
    
    describe "all params string" do
      let(:paymentPerMonth){ PaymentPerMonth.new(loan: "30000000", bonus: "5000000",
                            period: "30", apy: "1") }
      it "should return vaild amount" do
        paymentPerMonth.amount.should == 80410
      end
    end
  end

  describe "invalid amount" do
    describe "all propaty is nil" do
      before do
        @paymentPerMonth.loan = nil
        @paymentPerMonth.bonus = nil
        @paymentPerMonth.period = nil
        @paymentPerMonth.apy = nil
      end
      its(:amount){ should == nil }      
    end
  end  
end
