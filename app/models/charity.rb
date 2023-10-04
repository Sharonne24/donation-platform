class Charity < ApplicationRecord

    belongs_to :user
  has_many :beneficiaries
  has_many :donations
  has_many :stories

  
end
