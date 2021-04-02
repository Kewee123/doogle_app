Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#home'
  get 'static_pages/home'
    
  #resources :definitions, controller: 'definitions'
  #resources :words, controller: 'words'
    scope '/api' do
      get '/words', to: 'words#search'
    end
end