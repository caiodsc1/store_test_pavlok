FactoryBot.define do
  factory(:category) do
    name { FFaker::Product.product_name }
    main_category { association(:main_category) }
    after(:create) do |category|
      create_list :product, 5, category: category
    end
  end
end
