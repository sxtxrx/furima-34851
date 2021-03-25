FactoryBot.define do
  factory :item do
    name { '商品の名前' }
    price { 9_999_999 }
    description { Faker::Lorem.sentence }
    category_id { 1 }
    condition_id { 1 }
    ship_cost_id { 1 }
    prefecture_id { 1 }
    ship_day_id { 1 }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/1524839_558032077626615_427263571_n.jpg'), filename: 'test_image.jpg')
    end
  end
end
