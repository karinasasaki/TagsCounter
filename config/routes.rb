Rails.application.routes.draw do
  root "urls#index"
  resources :urls do
    resources :tags
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
