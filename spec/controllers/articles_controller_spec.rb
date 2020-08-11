require 'rails_helper'

describe ArticlesController, type: :controller do
  let(:article) { create(:article) }
  
  describe '#index' do
    subject { get :index }

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
    subject { post :create , params: { id: article, article: article_params } }
    context '正常にpostされた場合' do
      let(:article_params) { { subject: 'test', body: 'test', published_status: true } }
      it 'articleが生成される' do
        expect{subject}.to change(Article, :count).by(2)
      end
    end
    context '値が不正の場合' do
      let(:article_params) { { subject: nil, body: 'test', published_status: true } }
      it 'formをrenderし直す' do
        expect(subject).to render_template(:form)
      end
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
      expect(subject).to render_template(:form)
    end
  end

  describe '#update' do
    subject { patch :update , params: { id: article, article: article_params } }
    context '正常に記事更新される場合' do
      let(:article_params) { { subject: 'test2' } }
      it '更新される' do
        expect(subject).to eq 'test2'
      end
    end
    context '更新の値が不正の場合' do
      let(:article_params) { { subject: nil } }
      it 'formを再読み込み' do
        expect(subject).to render_template(:form)
      end
    end
  end

  describe '#destory' do
    subject { delete :destroy, params: { id: article } }
    context '記事を削除' do
      it '記事を削除' do
        expect{ subject }.to change(Article, :count).by(0)
      end
    end
  end
end