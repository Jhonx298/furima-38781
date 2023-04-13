FactoryBot.define do
  factory :product do
    name                {Faker::Name.last_name}
    product_description {Faker::Lorem.sentence}
    price               {rand(300..9999999)}
    category_id         {rand(2..11)}
    condition_id        {rand(2..7)}
    shipping_charge_id  {rand(2..3)}
    prefecture_id       {rand(2..48)}
    days_ship_id        {rand(2..4)}

    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
  end
end
