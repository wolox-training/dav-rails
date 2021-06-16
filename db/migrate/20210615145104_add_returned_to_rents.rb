class AddReturnedToRents < ActiveRecord::Migration[6.1]
  def change
    add_column :rents, :returned, :boolean, :default => false
  end
end
