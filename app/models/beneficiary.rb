class Beneficiary < ApplicationRecord
    belongs_to :charity
      
    validates :name, presence: true
    validates :description, presence: true
end
