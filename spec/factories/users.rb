FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"abc123"}
    password_confirmation {"abc123"}
    last_name              {"山田"}
    last_kana              {"ヤマダ"}
    first_name             {"太郎"}
    first_kana            {"タロウ"}
    birthday             {"2000-01-01"}
  end
end