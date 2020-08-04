require 'rails_helper'

describe Article do
  let(:article) { build(:article) }

  describe 'Article' do
    subject { article.valid? }
    it '有効な値ならバリデーションOK' do
      is_expected.to be_truthy
    end
    context 'subjectがない場合' do
      let(:article) { build(:article, :article_no_subject) }
      it 'バリデーションNG' do
        is_expected.to be_falsy
      end
    end
    context 'bodyがない場合' do
      let(:article) { build(:article, :article_no_body) }
      it 'バリデーションNG' do
        is_expected.to be_falsy
      end
    end
    context 'subjectが51文字以上の場合' do
      let(:article) { build(:article, :article_maximum_subject) }
      it 'バリデーションNG' do
        is_expected.to be_falsy
      end
    end
    context 'bodyが5001文字以上の場合' do
      let(:article) { build(:article, :article_maximum_body) }
      it 'バリデーションNG' do
        is_expected.to be_falsy
      end
    end
  end
end