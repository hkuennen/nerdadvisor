Rails.application.routes.draw do
  get 'applications/index'
  get 'applications/show'
  get 'applications/new'
  get 'applications/create'
  get 'jobs/index'
  get 'jobs/show'
  get 'jobs/new'
  get 'jobs/create'
  get 'jobs/edit'
  get 'jobs/destroy'
  devise_for :users
  root to: "pages#home"

  resources :jobs do
    resources :applications
  end

end
