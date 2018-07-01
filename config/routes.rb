Rails.application.routes.draw do
  root to: 'tops#top'
  get '/blogs/index', to: 'blogs#index'

  resources:blogs do
    collection do
      post :confirm
    end
  end

  resources :users, only: [:new, :create]

end
