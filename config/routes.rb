Rails.application.routes.draw do
  get '/', to: 'home#index'
  resources :projects
end
