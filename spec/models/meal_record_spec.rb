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
end