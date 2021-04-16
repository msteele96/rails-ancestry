class Family < ApplicationRecord
    has_many :relationships
    has_many :users, through: :relationships
    belongs_to :neighborhood
    validates :name, presence: true
    validates :name, uniqueness: true
end
