class Donor < ApplicationRecord
    has_many :donations

  validates :anonymous, inclusion: { in: [true, false] }
  validates :first_name, presence: true, unless: :anonymous?
  validates :last_name, presence: true, unless: :anonymous?
  validates :email, presence: true, uniqueness: true, unless: :anonymous?

  def anonymous?
    anonymous == true
  end
end
