## 各ページのルーティングを行うとこ

Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end

  resources :tests
  get 'ajax_test', to: 'tests#ajax_test'
  get 'iine_button', to: 'tweets#iine_button'
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions:      'users/sessions',
  }
  resources :users, :only => [:index, :show]
  root "tweets#index"


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
