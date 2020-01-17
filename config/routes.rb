Rails.application.routes.draw do
  get '/', to: 'home#index', as: 'home'
  post 'upwork', to: 'home#update'
  resources :projects
  resources :employees
  get 'search', to: "home#search"
end
