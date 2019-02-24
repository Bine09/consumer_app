Rails.application.routes.draw do
  resources :products
  get 'simple_pages/about'     # get the about site via the simple_pages controller
  get 'simple_pages/contact'
  get 'simple_pages/index'
  post 'simple_pages/thank_you'

  # root 'simple_pages#index'
  root 'simple_pages#landing_page'
  # root 'orders#index'

  resources :orders, only: [:index, :show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
