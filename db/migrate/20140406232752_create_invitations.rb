class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :token
      t.integer :sender_id
      t.integer :organization_id
      t.string :recipient_email
      t.boolean :used, default: false

      t.timestamps
    end
  end
end
