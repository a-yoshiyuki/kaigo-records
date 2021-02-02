class MealRecord < ApplicationRecord

  belongs_to :customer
  belongs_to :staff_member

end
