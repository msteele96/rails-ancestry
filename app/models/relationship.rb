class Relationship < ApplicationRecord
    belongs_to :family
    belongs_to :user
    scope :parental, -> { where(relationship_type: "parent") }

end
