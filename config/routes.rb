Rails.application.routes.draw do
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

