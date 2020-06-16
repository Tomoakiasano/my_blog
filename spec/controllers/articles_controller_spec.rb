require 'rails_helper'

describe ArticlesController, type: :controller do
    describe '#index' do
      it '200が返る' do
          get :index
          expect(response).to have_http_status '200'
          expect(response).to render_template 'articles/index'
      end
    end
end