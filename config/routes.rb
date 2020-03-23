Rails.application.routes.draw do
  root to: 'orders#index'
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'check'
      get 'done'
    end
  end
end
