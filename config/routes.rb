Rails.application.routes.draw do
  root to: 'blogs#index'
  get '/blogs/tops/top', to: 'blogs/tops#top',as: 'blogs_tops_top'

  resources:blogs do
    collection do
      post :confirm
    end
  end
end
