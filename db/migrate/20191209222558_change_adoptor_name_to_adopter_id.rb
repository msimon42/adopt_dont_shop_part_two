class ChangeAdoptorNameToAdopterId < ActiveRecord::Migration[5.1]
  def change
    rename_column :pets, :adopter_id, :adopter_id
  end
end
