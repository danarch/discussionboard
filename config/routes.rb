Rails.application.routes.draw do
  devise_for :users
  resources :articles do
    resources :comments
    member do
      patch :vote
      patch :unvote
    end
  end
  root 'welcome#index'
end
