class User < ApplicationRecord
    has_secure_password
    has_many :relationships
    has_many :families, through: :relationships
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :born, presence: true
    validates :password_digest, presence: true
    scope :living, -> { where(alive: true) }


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
