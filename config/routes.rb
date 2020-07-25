Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions'}
  root to: 'homes#index'
  resources :signups do
    collection do
      get 'step1', to: 'signups#step1'
      post 'step1', to: 'signups#step1_validates'
      get 'step2', to: 'signups#step2'
      post 'step2', to: 'signups#step2_validates'
      get 'mypage', to: 'signups#mypage'
    end
  end
  resources :babysitters
  resources :parents
  resources :homes do
    collection do
      get "search", to: "homes#search"
    end
  end
  resources :notifications, only: :index
  resources :orders do
    member do
      patch :approve
      patch :cancel
    end
    resources :chats, only: [:index, :create]
    namespace :api do 
      resources :chats, only: :index, defaults: { format: "json" }
    end
  end
  get "chatslist", to: "chats#list"

end
