Rails.application.routes.draw do
  
  devise_for :property_owners
  root to: 'home#index'

  resources :properties, only: [:show, :new, :create, :edit, :update] do
    get 'my_properties', on: :collection 
  end

  resources :property_types, only: [:show]
  resources :property_locations, only: [:show, :new, :create]
  
end
