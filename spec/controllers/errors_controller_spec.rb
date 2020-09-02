require 'rails_helper'

describe ErrorsController, type: :controller do
  describe '#render_404' do
    render_views

    controller do
      def index
        render_404
      end
    end
    
    let(:error) { ActiveRecord::RecordNotFound }
    it '404ページが表示されること' do
      get :index
      expect(response.status).to eq 404
      expect(response).to render_template('errors/error_404')
    end
  end

  describe '#render_505' do
    render_views

    controller do
      def index
        render_500
      end
    end

    let(:error) { StandardError }
    it '500ページが表示されること' do
      get :index
      expect(response.status).to eq 500
      expect(response).to render_template('errors/error_500')
    end
  end
end
