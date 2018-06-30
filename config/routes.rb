Rails.application.routes.draw do
  root to: 'blogs#index'
  get 'tops/top'

  resources:blogs do
    collection do
      post :confirm
    end
  end
end
