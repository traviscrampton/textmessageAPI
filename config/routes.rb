Rails.application.routes.draw do
  root to: "addressbooks#index"

  resources :addressbooks do
    resources :contacts, only: [:new, :create]
  end

  resources :contacts, except: [:new, :create] do
    resources :messages, only: [:index, :new, :show, :create]
  end
end
