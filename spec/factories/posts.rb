FactoryBot.define do
  factory :posts do
    title { 'テスト' }
    description { '雪山にいきたい' }
    user
  end
end