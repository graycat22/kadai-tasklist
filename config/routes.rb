Rails.application.routes.draw do
  
  root to: "tasks#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  resources :users, only: [:index, :show, :create]
  
  resources :tasks #, only: [:create, :destroy]
  
=begin
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # CRUD
  get "tasks/:id" => "task#show"
  post "tasks" => "task#create"
  put "tasks/:id" => "tasks#update"
  delete "tasks/:id" => "tasks#destroy"

  # index: show の補助ページ。index はshowへの一覧ページ
  get "tasks" => "tasks#index"
  
  # new: 新規作成用のフォームページ。create を補助する。
  get "tasks/new" => "tasks#new"
  
  # edit: 更新用のフォームページ。update に転送する。
  get "tasks/:id/edit" => "tasks#edit"
=end
end
