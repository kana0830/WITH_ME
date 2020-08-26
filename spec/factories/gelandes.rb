FactoryBot.define do
  factory :gelande do
    sequence(:name) { |n| "GALA湯沢スキー場#{n}" }
    postal "949-6101"
    address "新潟県南魚沼郡湯沢町大字湯沢字茅平1039-2"
    tel "025-785-6543"
    introduction "遊びに来てね"
  end
end
