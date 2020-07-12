Rails.application.routes.draw do
  resources :articles
  root 'articles#index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  }
  
  devise_scope :user do
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

  match '*not_found', controller: 'errors', action: 'render_404', via: :all
end
