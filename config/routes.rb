Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#root'
  resources :signups do
    collection do
      get 'step1'
      post 'step1', to: 'signup#step1_validates'
      get 'step2'
      post 'step2', to: 'signup#step2_validates'
      get 'check'
      get 'done'
    end
  end
  resources :homes, only: [:index]
end
