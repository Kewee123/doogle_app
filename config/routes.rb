Rails.application.routes.draw do
  resources :definitions
  resources :words
    root 'static_pages#home'
    get 'static_pages/admin'
    get 'static_pages/home'
end