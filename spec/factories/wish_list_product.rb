FactoryBot.define do
  factory(:wish_list_product) do
    wish_list { association(:wish_list) }
    product { association(:product) }
  end
end
