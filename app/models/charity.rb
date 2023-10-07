class Charity < ApplicationRecord

  belongs_to :user
  has_many :beneficiaries
  has_many :donations
  has_many :stories

  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :status, presence: true, inclusion: { in: ['pending', 'approved', 'rejected'] }
end
