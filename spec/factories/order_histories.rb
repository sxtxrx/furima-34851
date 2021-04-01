FactoryBot.define do
  factory :order_history do
    post_code { '123-1234' }
    city{ '横浜市' }
    address{ '1-1' }
    prefecture_id{ 1 }
    phone_number{ 12345678912 }
    building_name{ 'ハイツ' }
    token {"tok_abcdefghijk00000000000000000"}

    






    
  end
end
