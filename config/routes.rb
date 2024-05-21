Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  resources :instruments, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create, :show]
  end
end
