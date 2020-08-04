require 'rails_helper'

# RSpec.describe ErrorsController, type: :controller do
describe ErrorsController, type: :controller do
  describe '#render_404' do
    controller do
      def index
        render_404
      end
    end
    let(:error) { ActiveRecord::RecordNotFound }
    it '404ページが表示されること' do
      get :index
      expect(response.status).to have_http_status(:not_found)
      expect(response).to render_template('errors/error_404')
    end
  end
  

end
