Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { registrations: "user_registrations" } #devise gem
  resources :users

  resources :products do
    resources :comments, only: [:create, :destroy]
  end  #What nested resources allow us to do is to connect comment s to products

  get 'simple_pages/about'     # get the about site via the simple_pages controller
  get 'simple_pages/contact'   # get the contact
  get 'simple_pages/index' #simple pages controller and action index      simple_pages#index
  post 'simple_pages/thank_you'  #simple pages controller and action thank_you      simple_pages#thank_you
  post 'payments/create'  #

  root 'simple_pages#landing_page'

  resources :orders, only: [:index, :show, :create, :destroy]   #no update

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
