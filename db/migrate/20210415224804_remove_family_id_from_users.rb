class RemoveFamilyIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :family_id
  end
end
