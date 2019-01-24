Rails.application.routes.draw do
  namespace :api do
    get '/one_contact' => 'contacts#first_contact'
    get '/contacts' => 'contacts#index'
    post '/contacts' => 'contacts#create'
    get '/contacts/:id' => 'contacts#show'
    patch '/contacts/:id' => 'contacts#update'
    delete '/contacts/:id' => 'contacts#destroy'
  end
end
