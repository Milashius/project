Rails.application.routes.draw do
  resources :ideas do
  resources :comments
  end
end