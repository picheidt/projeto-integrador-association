class AddIndexToPeopleActive < ActiveRecord::Migration[7.1]
  def change
    add_index :people, :active 
  end
end
