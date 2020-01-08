FactoryBot.define do
  factory(:product) do
    name { FFaker::Product.product_name }
    price { '%.2f' % rand(1.0..1000) }
    category { association(:category) }
  end
end
