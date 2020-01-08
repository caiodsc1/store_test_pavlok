# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

json = File.read(Rails.root.join('products.json'))
hash = JSON.parse(json)
products = hash.first.last
valid_attrs = Product.new.attributes
products.map { |e| e["MainCategory"] }.uniq.each { |n| MainCategory.create(name: n) }
products.each do |e|
  Category.find_or_create_by(name: e["Category"],
                             main_category: MainCategory.find_by_name(e["MainCategory"]))
end

products.each do |product|
  attrs = product.transform_keys!(&:downcase).select do |k, v|
    {k => v} if valid_attrs.key?(k)
  end
  attrs.merge!({category: Category.find_by_name(product["category"])})
  Product.new(attrs).tap do |p|
    p.productpicurl = "https://sapui5.hana.ondemand.com/#{p.productpicurl.sub!('demokit/explored/img', 'documentation/sdk/images')}"
  end.save!
end
