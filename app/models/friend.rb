class Friend < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  validates :phone, presence: true, uniqueness: true, length: { minimum: 10, maximum: 15 }
  validates :last_name, presence: true
end
