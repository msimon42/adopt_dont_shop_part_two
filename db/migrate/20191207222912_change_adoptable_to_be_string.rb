class ChangeAdoptableToBeString < ActiveRecord::Migration[5.1]
  def change
    change_column :pets, :adoptable?, :string
  end
end
