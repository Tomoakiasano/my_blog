require 'rails_helper'

describe Article do
  let(:article) { build(:article) }

  describe 'Article' do
    subject { article.valid? }
   
    context 'OKの場合' do
      it { is_expected.to be_truthy } 
    end

    context 'NGの場合' do
      context 'subjectがない場合' do
        let(:article) { build(:article, :article_no_subject) }
        it { is_expected.to be_falsy } 
      end
     
      context 'bodyがない場合' do
        let(:article) { build(:article, :article_no_body) }
        it { is_expected.to be_falsy } 
      end

      context 'subjectが51文字以上の場合' do
        let(:article) { build(:article, :article_maximum_subject) }
        it { is_expected.to be_falsy } 
      end

      context 'bodyが5001文字以上の場合' do
        let(:article) { build(:article, :article_maximum_body) }
        it { is_expected.to be_falsy } 
      end
    end
  end
end