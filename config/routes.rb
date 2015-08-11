Rails.application.routes.draw do
  #w application.rb jest link na podstawie ktorego sie te linie tu znalazly
  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  get 'errors/file_not_found'
  get 'errors/unprocessable'
  get 'errors/internal_server_error'

  root 'mems#index'

  resources :mems do
    collection do
      get 'my'
      get 'inactive'
    end

  end

  get 'home/index'
  #root 'home#index'
  
  devise_for :users, :controllers => { registrations: "my_devise/registrations", omniauth_callbacks: "users/omniauth_callbacks" }
  
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  #do autentykacji przez fejsa wymagane
  #devise_scope :user do
  #  delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #end

end
