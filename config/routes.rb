Rails.application.routes.draw do
  root :to => "firsts#index"
  resources :thirds
  resources :seconds
  resources :firsts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
