FactoryBot.define do
  factory :purchase_form do
    post_code      {"123-4567"}
    prefecture_id  {rand(2..48)}
    city           {"サンプル県"}
    address_num    {"1-2-3"}
    building_name  {"建物"}
    phone_num      {"09012345678"}
    token          {"tok_abcdefghijk00000000000000000"}
  end
end
