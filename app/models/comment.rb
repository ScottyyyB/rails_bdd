class Comment < ApplicationRecord
  belongs_to :article
  validates :body, presence: true
  validates_email_format_of :email, message: "is not valid", if: :email?
end
