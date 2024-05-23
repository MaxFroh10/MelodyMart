Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  resources :instruments do
    resources :bookings, only: %i[new create show index]
  end
  # Route pour l'action destroy
  # delete '/instruments/:id', to: 'instruments#destroy', as: 'destroy_instrument'
end
