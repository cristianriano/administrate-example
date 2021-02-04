Rails.application.routes.draw do
  namespace :admin do
    resources :portions
    resources :ingredients
    resources :cocktails

    root to: 'cocktails#index'
  end
end
