Rails.application.routes.draw do

  root controller: :landing, action: :index
  resources :articles, only: [:new, :create] do
    resources :comments, only: [:create, :new]
  end
end
