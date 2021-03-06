Rails.application.routes.draw do
  devise_for :users

  root to: "banks#index"
  resources :packs
  resources :banks do
    collection do
      post "updatevalues"
    end
  end
  resources :phrases
  resources :cigs do
    collection do
      post "positive"
      post "negative"
    end
  end
end
