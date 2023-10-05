class Story < ApplicationRecord
  belongs_to :charity

  # Validations
  validates :title, presence: true
  validates :content, presence: true
end
