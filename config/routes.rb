Rails.application.routes.draw do
  resources :articles
  patch 'article/published', to: 'articles#published_article'
  patch 'article/unpublished', to: 'articles#unpublished_article'

  get '*not_found', controller: 'errors', action: 'render_404'
  post '*not_found', controller: 'errors', action: 'render_404'
end
