class Article < ApplicationRecord
    validates :subject, presence: true, length: { maximum: 100 }
    validates :body, presence: true, length: { maximum: 5000 }

    scope :status_published, -> { where(published_status: true) }
end
