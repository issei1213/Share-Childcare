Rails.application.routes.draw do
  root to: 'homes#root'
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'check'
      get 'done'
    end
  end
  resources :homes, only: [:index]
end
