class CreateOpportunities < ActiveRecord::Migration[5.1]
  def change
    create_table :opportunities do |t|

      t.timestamps
    end
  end
end
