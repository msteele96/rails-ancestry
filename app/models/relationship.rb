class Relationship < ApplicationRecord
    belongs_to :family
    belongs_to :user, optional: true

    def other_user(user)
        if self.user_1_id == user.id
            User.find(self.user_2_id)
        else
            User.find(self.user_1_id)
        end
    end
end
