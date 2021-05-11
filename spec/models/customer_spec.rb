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

  context "データが正しく保存されない" do
    before do
      @customer = Customer.new
      @customer.last_name = "テスト"
      @customer.first_name = nil
      @customer.last_name_kana = "テスト"
      @customer.first_name_kana = "テスト"
      @customer.is_deleted = 0
      @customer.save
    end
    it "first_nameが入力されてないので保存失敗" do
      expect(@customer).not_to be_valid
      expect(@customer.errors[:first_name]).to include("can't be blank")
    end
  end
end