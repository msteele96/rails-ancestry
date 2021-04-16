class AddNeighborhoodIdToFamilies < ActiveRecord::Migration[6.1]
  def change
    add_column :families, :neighborhood_id, :integer
  end
end
