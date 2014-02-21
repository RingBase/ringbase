class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :organization_id
      t.string :pilot_number
      t.string :title

      t.timestamps
    end
  end
end
