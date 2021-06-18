class MealRecord < ApplicationRecord

  belongs_to :customer
  belongs_to :staff_member

  validates :breakfast_main_amount, presence: true
  validates :breakfast_side_amount, presence: true
  validates :lunch_main_amount, presence: true
  validates :lunch_side_amount, presence: true
  validates :dinner_main_amount, presence: true
  validates :dinner_side_amount, presence: true
  validates :water_amount, presence: true

  def self.today_meal
    MealRecord.where(updated_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).last
  end

  def divide_monthly
    return self.meal_records.group("strftime('%Y%m', articles.created_at)").order(Arel.sql("strftime('%Y%m', articles.created_at) desc")).count
  end

end
