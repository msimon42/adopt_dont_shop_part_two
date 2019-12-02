class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.references :shelter
      t.string :image
      t.string :name
      t.string :description
      t.string :approx_age
      t.string :sex
      t.boolean :adoptable?
    end
  end
end
