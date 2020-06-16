class Article < ApplicationRecord
    validates :subject, presence: true
    validates :body, presence: true

    enum status: {unpublished: 0, published: 1}
end
