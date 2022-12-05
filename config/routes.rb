Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :jobs do
    resources :applications, only: [:new, :create, :show, :index]
  end
  resources :applications, only: [:destroy]
  resources :pages, only: [:index, :show]

end
