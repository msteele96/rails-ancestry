class User < ApplicationRecord
    has_secure_password
    belongs_to :family

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
