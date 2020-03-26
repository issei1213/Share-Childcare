Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#root'
  resources :signups, only: [:new, :create] do
    collection do
      get 'step1', to: 'signups#step1'
      post 'step1', to: 'signups#step1_validates'
      get 'step2', to: 'signups#step2'
      post 'step2', to: 'signups#step2_validates'
      get 'done', to: 'signups#done'
    end
  end
  resources :homes, only: [:index]
end
