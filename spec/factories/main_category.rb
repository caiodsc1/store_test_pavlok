FactoryBot.define do
  factory(:main_category) do
    name { FFaker::Product.product_name }

    after(:create) do |main_category|
      create_list :category, 3, main_category: main_category
    end
  end
end
