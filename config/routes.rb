Rails.application.routes.draw do
  namespace :api do
    get '/one_contact' => 'contacts#first_contact'
  end
end
