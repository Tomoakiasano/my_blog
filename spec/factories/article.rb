FactoryBot.define do
  factory :article do
    subject { 'MyString' }
    body { 'MyText' }
    published_status { true }

    trait :article_no_subject do
      subject { nil }
    end

    trait :article_no_body do
      body { nil }
    end

    trait :article_maximum_subject do
      subject { 't' * 51 }
    end

    trait :article_maximum_body do
      body { 't'* 5001 }
    end
  end
end