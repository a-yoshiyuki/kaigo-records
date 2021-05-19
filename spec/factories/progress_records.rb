FactoryBot.define do
  factory :progress_record do
    time { "12:00" }
    detail { "テスト" }
    customer_id { 1 }
    staff_member_id{ 1 }
  end
end
