FactoryBot.define do
  factory :customer do
    last_name { "テスト" }
    first_name { "テスト" }
    last_name_kana { "テスト" }
    first_name_kana { "テスト" }
    is_deleted { 0 }
  end
end