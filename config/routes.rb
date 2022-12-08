Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :jobs do
    resources :applications, only: [:new, :create, :show, :index]
  end
  resources :events, only: [:index, :new, :create, :show, :destroy] do
    resources :attendees, only: [:index, :create, :new]
  end

  resources :applications, only: [:destroy]
  resources :pages, only: [:index, :show]

  post "/levelup", to: "pages#levelup"
end
