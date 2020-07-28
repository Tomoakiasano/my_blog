class ErrorsController < ApplicationController
  protect_from_forgery with: :exception
  rescue_from Exception, with: :render_500
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def render_404(error = nil)
    render template: 'errors/error_404', status: :not_found
  end
  
  def render_500(error = nil)
    @errors = error
    render template: 'errors/error_500', status: :internal_server_error
  end
end
