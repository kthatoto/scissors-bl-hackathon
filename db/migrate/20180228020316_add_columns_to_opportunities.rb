class AddColumnsToOpportunities < ActiveRecord::Migration[5.1]
  def change
    add_column :opportunities, :user_id, :integer
    add_column :opportunities, :date, :datetime
    add_column :opportunities, :time_zone, :integer
    add_column :opportunities, :hour, :integer
    add_column :opportunities, :price, :integer
    add_column :opportunities, :is_sold, :boolean
  end
end
