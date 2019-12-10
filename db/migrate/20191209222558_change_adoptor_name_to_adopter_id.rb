class ChangeAdoptorNameToAdopterId < ActiveRecord::Migration[5.1]
  def change
    rename_column :pets, :adoptor_name, :adopter_id
  end
end
