require 'rails_helper'

describe ArticlesController, type: :controller do
  let(:article) { Article.create(subject: 'test', body: 'test', published_status: true) }
  
  describe '#index' do
    subject do
      get :index
    end
    it '200が返る' do
      expect(subject).to have_http_status(:success)
    end
    it 'render index' do
      expect(subject).to render_template(:index)
    end
  end

  describe '#show' do
    subject do
      get :show, params: { id: article }
    end
    it '200が返る' do
      expect(subject).to have_http_status(:success)
    end
    it 'render show' do
      expect(subject).to render_template(:show)
    end
  end

  describe '#create' do
    subject do
      post :create, params: {
        article: {
          subject: nil,
          body: 'test',
          published_status: true
        }
      }
    end
    it 'articleが生成される' do
      expect {
        post :create, params: {
          article: {
            subject: 'test',
            body: 'test',
            published_status: true
          }
        } 
      }.to change(Article, :count).by(1)
    end
    it '値が不正の場合newwを読み直す' do
      expect(subject).to render_template(:new)
    end
  end

  describe '#edit' do
    subject do
      get :edit, params: { id: article }
    end
    it '200が返る' do
      expect(subject).to have_http_status(:success)
    end
    it 'render edit' do
      expect(subject).to render_template(:edit)
    end
  end

  describe '#update' do
    it '記事更新される' do
      article_params = { subject: 'test2' }
      patch :update , params: { id: article, article: article_params }
      expect(article.reload.subject).to eq 'test2'
    end
    it '更新の値が不正な場合editをrender' do
      article_params = { subject: nil }
      patch :update , params: { id: article, article: article_params }
      expect(response).to render_template(:edit)
    end
  end

  describe '#destory' do
    article = Article.create(subject: 'test', body: 'test', published_status: true)
    it '記事を削除' do
      expect{ 
        delete :destroy, params: { id: article }
      }.to change(Article, :count).by(-1)
    end
  end
end