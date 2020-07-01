Rails.application.routes.draw do
  devise_for :users
  resources :articles

  match '*not_found', controller: 'errors', action: 'render_404', via: :all
end
