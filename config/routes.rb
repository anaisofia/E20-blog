Rails.application.routes.draw do

  get 'pages/dashboard'
  get 'pages/change_role/:id', to: 'pages#change_role', as: 'pages_change_role'
  delete "pages/remove_user/:id", to: 'pages#remove_user', as:  'pages_remove_user'

	resources :posts do
		resources :comments, only: [:create, :destroy]
	end

	devise_for :users, controllers: {
		sessions: 'users/sessions',
		registrations: 'users/registrations'
	}

	root 'posts#index'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
