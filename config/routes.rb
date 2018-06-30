Rails.application.routes.draw do
  root to: 'blogs#index'
  get 'blogs/top'

  resources:blogs do
    collection do
      post :confirm
    end
  end
end
