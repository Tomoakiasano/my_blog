class Article < ApplicationRecord
  belongs_to :user
  has_many :commnet, dependent: :destroy
  has_many :article_comment

  validates :subject, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 5000 }

  scope :status_published, -> { where(published_status: true) }
end
