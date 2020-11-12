Rails.application.routes.draw do
  resources :orders, only: %i[index show] do
    resource :cancel_order, only: :create
  end
end
