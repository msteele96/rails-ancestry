class Relationship < ApplicationRecord
    belongs_to :family
    belongs_to :user
    validates :relationship_type, presence: true
    validates :user_id, presence: true
    validates :family_id, presence: true
end
