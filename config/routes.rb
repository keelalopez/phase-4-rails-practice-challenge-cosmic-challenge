Rails.application.routes.draw do
  resources :planets, only:[:index, :show]
  resources :missions, only:[:index, :create]
  resources :scientists, only:[:index, :show, :create, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
