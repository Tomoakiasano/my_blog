require 'rails_helper'

describe Article do
  let(:article) { article = Article.new(subject: 'test', body: 'test', published_status: true) }
  let(:article_no_subject) { article = Article.new(subject: nil, body: 'test', published_status: true) }
  let(:article_no_body) { article = Article.new(subject: 'test', body: nil, published_status: true) }
  let(:article_maximum_subject) { article = Article.new(subject: 't' * 101, body: 'test', published_status: true) }
  let(:article_maximum_body) { article = Article.new(subject: 'test', body: 't'* 5001, published_status: true) }

  describe 'Article' do
    it '有効な値ならArticleが生成される' do
      expect(article).to be_valid
    end
    it 'subjectがない場合はNG' do
      expect(article_no_subject).to be_invalid
    end
    it 'bodyがない場合はNG' do
      expect(article_no_body).to be_invalid
    end
    it 'subjectが101文字以上の場合はNG' do
      expect(article_maximum_subject).to be_invalid
    end
    it 'bodyが5001文字以上の場合はNG' do
      expect(article_maximum_body).to be_invalid
    end
  end
end