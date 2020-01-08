json.extract! wish_list, :id, :name, :created_at, :updated_at
json.products do
  wish_list.products
end
json.url wish_list_edit_path(wish_list)
