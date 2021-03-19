FactoryBot.define do
  factory :user do
    nickname { 'tarou' }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { '山田' }
    first_name_kana { 'ヤマダ' }
    family_name { '太朗' }
    family_name_kana { 'タロウ' }
    birthday { '1986-04-04' }
  end
end
