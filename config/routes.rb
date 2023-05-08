Rails.application.routes.draw do

  root 'batches#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: 'schools#index'
  namespace :admin do
    resources :schools
    resources :school_admins
    resources :users
    resources :courses
    resources :batches
    resources :enrolment_requests do
      patch :approve, on: :member
      patch :reject, on: :member
    end
  end

  resources :enrolments
  resources :batches, only: [:index] do
    collection do
      get 'current_user_batches', as: 'current'
    end
    member do
      get 'show_users'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users
      devise_scope :user do
        post 'login', to: 'sessions#create'
        delete 'logout', to: 'sessions#destroy'
      end


    end
  end
end
