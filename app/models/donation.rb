class Donation < ApplicationRecord
  belongs_to :donors
  belongs_to :charity

  validates :donors, presence: true
  validates :charity, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :recurring, inclusion: { in: [true, false] }
  validates :anonymous, inclusion: { in: [true, false] }
end
