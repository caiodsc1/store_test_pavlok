Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  get '/wish_lists', to: 'wish_lists#edit', as: 'wish_list_edit'

  resources :wish_lists, only: :update do
    get '/category/:category',
        to: 'wish_lists#edit',
        as: 'category_edit',
        on: :collection

    delete '/produto/:product_id',
           to: 'wish_lists#destroy_wish_list_product',
           as: 'product_destroy',
           on: :member
  end
  resources :charges, only: [:new, :create]

  root 'wish_lists#edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
