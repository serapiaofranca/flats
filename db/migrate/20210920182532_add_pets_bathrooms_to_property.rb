class AddPetsBathroomsToProperty < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :pets, :boolean
    add_column :properties, :bathrooms, :integer
  end
end
