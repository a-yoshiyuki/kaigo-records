require 'rails_helper'

RSpec.describe ProgressRecord, type: :model do
  context "データが正しく保存される" do
    before do
      @staff_member = FactoryBot.create(:staff_member)
      @customer = FactoryBot.create(:customer)
      @progress_record = ProgressRecord.new
      @progress_record.staff_member = @staff_member
      @progress_record.customer = @customer
      @progress_record.time = "12:00"
      @progress_record.detail = "テスト"
      @progress_record.save
    end
    it "保存成功" do
      expect(@progress_record).to be_valid
    end
  end

  context "データが正しく保存されない" do
    before do
      @staff_member = FactoryBot.create(:staff_member)
      @customer = FactoryBot.create(:customer)
      @progress_record = ProgressRecord.new
      @progress_record.staff_member = @staff_member
      @progress_record.customer = @customer
      @progress_record.time = "12:00"
      @progress_record.detail = ""
      @progress_record.save
    end
    it "detailが入力されてないので保存失敗" do
      expect(@progress_record).to be_valid
      expect(@progress_record.errors[:detail]).to include("can't be blank")
    end
  end
end