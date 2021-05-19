FactoryBot.define do
  factory :vital_record do
    time { "12:00" }
    body_temperature { "36.0" }
    heart_rate { "69" }
    oxygen { "96" }
    blood_pressure_high { "123" }
    blood_pressure_low { "78" }
    customer_id { 1 }
    staff_member_id{ 1 }
  end
end
