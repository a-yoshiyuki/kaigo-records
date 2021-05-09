require 'rails_helper'

RSpec.describe MealRecord, type: :model do
  context "データが正しく保存される" do
    before do
      @staff_member = FactoryBot.create(:staff_member)
      @customer = FactoryBot.create(:customer)
      @meal_record = MealRecord.new
      @meal_record.staff_member = @staff_member
      @meal_record.customer = @customer
      @meal_record.breakfast_main_amount = "10"
      @meal_record.breakfast_side_amount = "10"
      @meal_record.lunch_main_amount = "10"
      @meal_record.lunch_side_amount = "10"
      @meal_record.dinner_main_amount = "10"
      @meal_record.dinner_side_amount = "10"
      @meal_record.water_amount = "200"
      @meal_record.save
    end
    it "保存成功" do
      expect(@meal_record).to be_valid
    end
  end

  context "データが正しく保存されない" do
    before do
      @staff_member = FactoryBot.create(:staff_member)
      @customer = FactoryBot.create(:customer)
      @meal_record = MealRecord.new
      @meal_record.staff_member = @staff_member
      @meal_record.customer = @customer
      @meal_record.breakfast_main_amount = "10"
      @meal_record.breakfast_side_amount = "10"
      @meal_record.lunch_main_amount = ""
      @meal_record.lunch_side_amount = "10"
      @meal_record.dinner_main_amount = "10"
      @meal_record.dinner_side_amount = "10"
      @meal_record.water_amount = "200"
      @meal_record.save
    end
    it "lunch_main_amountが入力されてないので保存失敗" do
      expect(@meal_record).to be_invalid
      expect(@meal_record.errors[:lunch_main_amount]).to include("can't be blank")
    end
  end
end