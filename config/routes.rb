Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#index'
  resources :babysitters
  resources :parents
  resources :homes
  get "chatslist", to: "chats#list"
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
  resources :notifications, only: :index
  resources :signups do
    collection do
      get 'step1', to: 'signups#step1'
      post 'step1', to: 'signups#step1_validates'
      get 'step2', to: 'signups#step2'
      post 'step2', to: 'signups#step2_validates'
      get 'mypage', to: 'signups#mypage'
    end
  end
end
