class ErrorsController < ApplicationController
    rescue_from Exception, with: :render_500
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404
  
    def render_404(error = nil)
      logger.warn "404エラー: #{error.message + '¥n' + error.backtrace.join('¥n') if error }"
      render template: 'errors/error_404', status: :not_found
    end
    
    def render_500(error = nil)
      logger.error "500エラー: #{error.message + '¥n' + error.backtrace.join('¥n') if error }"
      render template: 'errors/error_500', status: :internal_server_error
    end
end
