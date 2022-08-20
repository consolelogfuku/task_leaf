Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#dstroy"

  namespace :admin do
    resources :users
  end
  root to: "tasks#index" # localhost:3000にアクセスすると"tasks/index"に繋がる
  resources :tasks # ルーティングの一括設定
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
