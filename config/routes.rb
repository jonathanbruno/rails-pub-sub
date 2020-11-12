Rails.application.routes.draw do
  resources :products
  resources :orders, only: %i[index show] do
    resource :cancel_order, only: :create
  end

  root 'orders#index'
end
