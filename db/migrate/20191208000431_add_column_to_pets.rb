class AddColumnToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :adoptor_name, :string
  end
end
