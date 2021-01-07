Rails.application.routes.draw do
  get  'home_page/home'
  root 'home_page#home'
end
