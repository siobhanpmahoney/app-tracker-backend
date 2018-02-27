Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users
      resources :categories
      resources :bookmarks
      resources :notes
      resources :industries
      resources :jobs
      resources :companies

      get '/users/:id/jobs', to: 'users#user_jobs'
      get '/users/:id/jobs', to: 'user#add_jobs'
      post '/users/:id/jobs', to: 'users#add_jobs'

      get '/users/:id/companies', to: 'users#user_companies'

      # post '/login', to: 'auth#login'
      # get '/current_user', to: 'auth#currentUser'
      # post '/signup', to: 'auth#signup'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
