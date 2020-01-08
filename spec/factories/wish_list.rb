FactoryBot.define do
  factory(:wish_list) do
    name { FFaker::Product.product_name }
    after(:create) do |wish_list|
      create_list :wish_list_product, 5, wish_list: wish_list
    end
  end
end
