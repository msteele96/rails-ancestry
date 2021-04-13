class User < ApplicationRecord
    has_secure_password
    belongs_to :family
    has_many :relationships, through: :family

    def living?
        if self.died? == true
            self.alive = false
            self.save
        else
            self.alive = true
            self.save
        end
    end
end
