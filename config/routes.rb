Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'login' => 'authentication#authenticate_user'
  get 'users' => 'users#index'
end
