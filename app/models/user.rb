class User < ApplicationRecord

    has_secure_password

    # associations
    has_many :donations, as: :donorable
    has_many :applications, as: :applicantable

    
end
