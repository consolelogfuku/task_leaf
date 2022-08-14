Rails.application.routes.draw do
  root to: "tasks#index" # localhost:3000にアクセスすると"tasks/index"に繋がる
  resources :tasks # ルーティングの一括設定
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
