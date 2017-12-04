class Comment < ApplicationRecord
  belongs_to :article
  validates :body, presence: true
  validates_format_of :email, with: /\A\w[a-zA-Z0-9_.-]*\@[a-z]+\.[a-z]+\Z/i, if: :email?
end
