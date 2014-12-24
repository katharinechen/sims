Rails.application.routes.draw do
  root 'inventories#index'
  resources :items
  resources :inventories, path: 'inventory'
end
