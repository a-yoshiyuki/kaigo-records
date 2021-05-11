require 'rails_helper'

RSpec.describe VitalRecord, type: :model do
  context "データが正しく保存される" do
    before do
      @staff_member = FactoryBot.create(:staff_member)
      @customer = FactoryBot.create(:customer)
      @vital_record = VitalRecord.new
      @vital_record.staff_member = @staff_member
      @vital_record.customer = @customer
      @vital_record.time = "12:00"
      @vital_record.body_temperature = "36.0"
      @vital_record.heart_rate = "60"
      @vital_record.oxygen = "96"
      @vital_record.blood_pressure_high = "123"
      @vital_record.blood_pressure_low = "69"
      @vital_record.save
    end
    it "保存成功" do
      expect(@vital_record).to be_valid
    end
  end

  context "データが正しく保存されない" do
    before do
      @staff_member = FactoryBot.create(:staff_member)
      @customer = FactoryBot.create(:customer)
      @vital_record = VitalRecord.new
      @vital_record.staff_member = @staff_member
      @vital_record.customer = @customer
      @vital_record.time = "12:00"
      @vital_record.body_temperature = "36.0"
      @vital_record.heart_rate = "60"
      @vital_record.oxygen = nil
      @vital_record.blood_pressure_high = "123"
      @vital_record.blood_pressure_low = "69"
      @vital_record.save
    end
    it "oxygenが入力されてないので保存失敗" do
      expect(@vital_record).not_to be_valid
      expect(@vital_record.errors[:oxygen]).to include("can't be blank")
    end
  end
end