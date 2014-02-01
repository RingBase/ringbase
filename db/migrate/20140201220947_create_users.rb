class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :phone_number
      t.string :password_digest
      t.string :auth_token
      t.integer :organization_id

      t.timestamps
    end
  end
end
