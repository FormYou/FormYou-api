Rails.application.routes.draw do
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'

  namespace :api, defaults: { format: :json } do
    resources :users, only: %w[show index update destroy] do
      collection do
        get :teacher
        get :student
        get :checked
      end
    end
    resources :attendences
    resources :formations do 
      resources :sessions
    end
    resources :sessions
    resources :categories
    resources :assignement_categories
    resources :rooms
  end
  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'api/login',
      sign_out: 'api/logout',
      registration: 'api/signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
end
