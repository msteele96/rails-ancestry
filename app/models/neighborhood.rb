class Neighborhood < ApplicationRecord
    has_many :families
    validates :name, presence: true
end
