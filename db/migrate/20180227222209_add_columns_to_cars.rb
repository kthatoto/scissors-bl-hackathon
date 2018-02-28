class AddColumnsToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :user_id, :integer
    add_column :cars, :name, :string
    add_column :cars, :maturity, :datetime
  end
end
