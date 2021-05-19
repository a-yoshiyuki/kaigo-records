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

end
