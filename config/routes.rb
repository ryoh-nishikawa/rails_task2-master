Rails.application.routes.draw do
  root to: 'blogs#index'
  get 'blog/top'

  resources:blogs do
    collection do
      post :confirm
    end
  end
end
