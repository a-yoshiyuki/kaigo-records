require 'rails_helper'

RSpec.describe Customer, type: :model do
  context "データが正しく保存される" do
    before do
      @customer = Customer.new
      @customer.last_name = "テスト"
      @customer.first_name = "テスト"
      @customer.last_name_kana = "テスト"
      @customer.first_name_kana = "テスト"
      @customer.is_deleted = 0
      @customer.save
    end
    it "保存成功" do
      expect(@customer).to be_valid
    end
  end
end