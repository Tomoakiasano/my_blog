class Article < ApplicationRecord
    validates :subject, presence: true
    validates :body, presence: true

    enum published_status: {unpublished: false, published: true}
end
