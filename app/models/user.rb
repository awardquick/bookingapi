class User < ApplicationRecord
  belongs_to :account
  has_secure_password
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            presence: true,
            length: { minimum: 8 },
            if: -> { new_record? || !password.nil? }
end
