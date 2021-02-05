FactoryBot.define do
  factory :item do
    name           {"test"}
    description     {"test"}
    category_id     {2}
    condition_id       {2}
    postage_payer_id  {2}
    prefecture_id     {2}
    preparation_day_id {2}
    price    {400}
    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png', content_type: 'image/png')
    end
  end
end
