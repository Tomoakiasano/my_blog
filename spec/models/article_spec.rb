require 'rails_helper'

describe Article do
  let(:article) { FactoryBot.build(:article) }

  describe 'Article' do
    subject { article.valid? }
    it '有効な値ならバリデーションOK' do
      is_expected.to be_truthy
    end
    context 'subjectがない場合' do
      let(:article_no_subject) { FactoryBot.build(:article, :article_no_subject) }
      subject { article_no_subject.valid? }
      it 'バリデーションNG' do
        is_expected.to be_falsy
      end
    end
    context 'bodyがない場合' do
      let(:article_no_body) { FactoryBot.build(:article, :article_no_body) }
      subject { article_no_body.valid? }
      it 'バリデーションNG' do
        is_expected.to be_falsy
      end
    end
    context 'subjectが51文字以上の場合' do
      let(:article_maximum_subject) { FactoryBot.build(:article, :article_maximum_subject) }
      subject { article_maximum_subject.valid? }
      it 'バリデーションNG' do
        is_expected.to be_falsy
      end
    end
    context 'bodyが5001文字以上の場合' do
      let(:article_maximum_body) { FactoryBot.build(:article, :article_maximum_body) }
      subject { article_maximum_body.valid? }
      it 'バリデーションNG' do
        is_expected.to be_falsy
      end
    end
  end
end