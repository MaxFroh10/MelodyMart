Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  # To list all rentings to be approved
  resources :bookings, only: :index, as: 'all_rentings'
  resources :bookings, except: :index do
    # Add routez to update the status of a booking
    collection do
      post 'approve'
      post 'deny'
    end
  end

  resources :instruments, except: :index do
    resources :bookings, only: %i[new create show]
    # Add route to show all instruments owned by the current user
    collection do
      get 'owner'
    end
  end
end
