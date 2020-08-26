FactoryBot.define do
  factory :user do
    name 'テスト太郎'
    sequence(:email) { |n| "test#{n}@test.com" }
    password 'password'
  end
end
