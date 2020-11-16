Rails.application.routes.draw do
  resources :products
  devise_for :users
  root to: "pages#main"
  get "/about", to: "pages#about", as: "about"
  get "/contact", to: "pages#contact", as: "contact"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/show/:id/buy", to: "products#buy", as: "buy"
  get "/show/:id/success", to: "products#success", as: "success"
  get "/show/:id/cancel", to: "products#cancel", as: "cancel"

end
