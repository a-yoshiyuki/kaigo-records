FactoryBot.define do
  factory :meal_record do
    breakfast_main_amount { 10 }
    breakfast_side_amount { 10 }
    lunch_main_amount { 10 }
    lunch_side_amount { 10 }
    dinner_main_amount { 10 }
    dinner_side_amount { 10 }
    water_amount { 100 }
    customer_id { 1 }
    staff_member_id{ 1 }
  end
end