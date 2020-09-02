class Article < ApplicationRecord
  validates :subject, presence: true, length: {maximum: 50}
  validates :body, presence: true, length: {maximum: 5_000}

  default_scope { order(created_at: :desc) }
  scope :status_published, -> { where(published_status: true) }
end
