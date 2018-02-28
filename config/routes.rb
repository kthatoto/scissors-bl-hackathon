Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'
  get 'tutor' => 'dashboard#tutor'
  get 'student' => 'dashboard#student'

  resources :users, only: [:edit, :update]
  resources :cars, only: [:new, :create]
  resources :opportunities, only: [] do
    collection do
      get :search
    end
  end
end
