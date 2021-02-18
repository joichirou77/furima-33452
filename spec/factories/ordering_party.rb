FactoryBot.define do
  factory :ordering_party do
    token {"tok_abcdefghijk00000000000000000"}
    post_code           {"108-0002"}
    prefecture_id     {2}
    city     {"テスト"}
    house_number       {"テスト111"}
    building_name  {"テスト"}
    phone_number     {"08011111111"}
    association :item_id, factory: :item
    association :user_id, factory: :user
  end
end