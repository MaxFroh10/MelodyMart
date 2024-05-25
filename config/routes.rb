Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  resources :instruments do
    resources :bookings, only: %i[new create show]
    # Add route to show all instruments owned by the current user
    collection do
      get 'owner'
    end
  end
  resources :bookings, only: %i[index]
end
