Rails.application.routes.draw do
  resources :articles

  match '*not_found', controller: 'errors', action: 'render_404', via: :all
end
