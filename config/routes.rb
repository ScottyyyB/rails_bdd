Rails.application.routes.draw do
  root controller: :landing, action: :index
  resources :articles, only: [:new, :create, :show]
end
