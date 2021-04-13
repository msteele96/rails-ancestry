class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.string :relationship_type
      t.integer :user_1_id
      t.integer :user_2_id
      t.integer :family_id

      t.timestamps
    end
  end
end
