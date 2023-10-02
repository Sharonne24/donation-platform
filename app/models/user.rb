class User < ApplicationRecord
    has_secure_password

    # associations
    has_many :donations, as: :donorable
    has_many :applications, as: :applicantable

     #validations
     validates :email, presence: true, uniqueness: true
     validates :firstname, presence: true
     validates :secondname, presence: true
     validates :role, presence: true
end
