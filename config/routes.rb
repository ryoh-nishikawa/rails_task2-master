Rails.application.routes.draw do
  root to: 'tops#index'

  resources:blogs do
    collection do
      post :confirm
    end
  end
  resources:blogs do
    collection do
      get :index
    end
  end
end
