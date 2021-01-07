Rails.application.routes.draw do
  get 'home_page/home'
  root 'application#hello'
end