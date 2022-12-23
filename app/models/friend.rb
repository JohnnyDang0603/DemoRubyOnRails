class Friend < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: {message: "empty rui ne"}
end
