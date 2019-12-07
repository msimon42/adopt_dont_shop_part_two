class ChangeAdoptableToAdoptionStatus < ActiveRecord::Migration[5.1]
  def change
    rename_column :pets, :adoptable?, :adoption_status
  end
end
