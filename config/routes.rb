Rails.application.routes.draw do

  get 'session/exit'
  root to: 'starts#top'
  namespace :admin do
    root 'homes#top'
    get '/admins/sign_out' => 'devise/sessions#destroy'
  end

  namespace :admin do
    resources :customers, except: [:destroy] do
      collection do
        get :list
        patch :exit
      end
    end
  end

  namespace :admin do
    resources :staff_members
  end

  namespace :staff_member do
    root 'customers#index'
    get '/admins/sign_out' => 'devise/sessions#destroy'
  end

  namespace :staff_member do
    resources :customers, only: [:index, :show]
  end

  namespace :staff_member do
    resources :progress_records
  end

  namespace :staff_member do
    resources :vital_records, only: [:show, :new, :edit, :create, :update, :destroy]
    get '/vital_records/customer/:customer_id', to: 'vital_records#index'
  end

  namespace :staff_member do
    resources :meal_records, only: [:show, :edit, :update, :destroy, :index]
    get '/meal_records/customer/:customer_id', to: 'meal_records#new', as: 'new_staff_member_meal_record'
    post '/meal_records/customer/:customer_id', to: 'meal_records#create'
  end

    devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
    devise_for :staff_members, controllers: {
    sessions:      'staff_members/sessions',
    passwords:     'staff_members/passwords',
    registrations: 'staff_members/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

