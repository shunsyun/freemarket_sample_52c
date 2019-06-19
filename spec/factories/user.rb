FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    family_name           {"abe"}
    first_name            {"taro"}
    family_kana_name      {"アベ"}
    first_kana_name       {"タロウ"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end

end