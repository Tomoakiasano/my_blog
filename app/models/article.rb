class Article < ApplicationRecord
    validates :subject, presence: true
    validates :body, presence: true
end
